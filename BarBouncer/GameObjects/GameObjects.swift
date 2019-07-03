//
//  BallClass.swift
//  BarBouncer
//
//  Created by Brian Cao on 5/14/19.
//  Copyright © 2019 Brian Cao. All rights reserved.
//

import Foundation
import SpriteKit

class Ball: SKSpriteNode {
    
    var isTransparent = false
    var moveDirection: direction
    let force: Int
    
    init(x: CGFloat, y: CGFloat, moveDirection: direction, force: Int = 1) {
        let ballDiameter: CGFloat = 10
        self.moveDirection = moveDirection
        self.force = force
        
        super.init(texture: SKTexture(imageNamed: "WhiteBall"), color: UIColor.clear, size: CGSize(width: ballDiameter, height: ballDiameter))
        
        self.position = CGPoint(x: x, y: y )
        self.physicsBody = SKPhysicsBody(circleOfRadius: ballDiameter/2)
        
        self.physicsBody?.friction = 0
        self.physicsBody?.linearDamping = 0
        self.physicsBody?.restitution = 1
        self.physicsBody?.allowsRotation = false
        
        self.physicsBody?.categoryBitMask = BitMask.ball
        self.physicsBody?.collisionBitMask = BitMask.bounceBar | BitMask.solidBar | BitMask.breakBar
    }
    
    func applyMoveDirection(){
        switch self.moveDirection {
            case .up: self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: force))
            case .right: self.physicsBody?.applyImpulse(CGVector(dx: force, dy: 0))
            case .down: self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: -force))
            case .left: self.physicsBody?.applyImpulse(CGVector(dx: -force, dy: 0))
        }
    }
    
    func flipTransparency() {
        if isTransparent {
            self.physicsBody?.collisionBitMask = BitMask.bounceBar | BitMask.solidBar | BitMask.breakBar
            self.texture = SKTexture(imageNamed: "WhiteBall")
            isTransparent = false
        }else{
            self.physicsBody?.collisionBitMask = BitMask.solidBar | BitMask.breakBar
            self.texture = SKTexture(imageNamed: "RedBall")
            isTransparent = true
        }
    }
    
    func clone() -> Ball{
        return Ball(x: self.position.x, y: self.position.y, moveDirection: self.moveDirection, force: self.force)
    }
    
    func changeMoveDirection() {
        switch moveDirection {
        case .up:
            self.moveDirection = .right
        case .right:
            self.moveDirection = .down
        case .down:
            self.moveDirection = .left
        case .left:
            self.moveDirection = .up
        }
    }
    
    func print() -> String{
        return "Ball(x: \(self.position.x), y: \(self.position.y), moveDirection: \(self.moveDirection), force: \(self.force))"
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class EndZone: SKSpriteNode{
    
    init(x: CGFloat, y: CGFloat) {
    
        super.init(texture: nil, color: .green, size: CGSize(width: 20, height: 20))
        self.position = CGPoint(x: x, y: y)
       // self.physicsBody = SKPhysicsBody(rectangleOf: size)
       // self.physicsBody?.categoryBitMask = BitMask.endZone
    }
    
    func clone() -> EndZone {
        return EndZone(x: self.position.x, y: self.position.y)
    }
    
    func print() -> String{
        return "EndZone(x: \(self.position.x), y: \(self.position.y))"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class Bar: SKSpriteNode {
    
    var angle: Angle
    
    init(x: CGFloat, y: CGFloat, angle: Angle, color: UIColor){
        self.angle =  angle
        super.init(texture: nil, color: color, size: CGSize(width: 0, height: 0))
        self.position = CGPoint(x: x, y: y)
        
        
        setAngle(angle: angle)
    }
    
    func setAngle(angle: Angle){
        self.angle = angle
        switch angle {
        case .right:
            self.zRotation = CGFloat.pi/4
        case .straight:
            self.zRotation = CGFloat.pi/2
        case .left:
            self.zRotation = CGFloat.pi * CGFloat(3/4)
        case .flat:
            self.zRotation = CGFloat.pi
        }
    }
    
    func setColor(color: UIColor) {
        self.color = color
    }
    
    func turn() {
        switch angle {
        case .right:
            setAngle(angle: .flat)
        case .flat:
            setAngle(angle: .left)
        case .left:
            setAngle(angle: .straight)
        case .straight:
            setAngle(angle: .right)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BounceBar: Bar {
    
    init(x: CGFloat, y: CGFloat, angle: Angle) {
        super.init(x: x, y: y, angle: angle, color: .white)
        setAngle(angle: angle)
        setColor(color: .white)
        let size = CGSize(width: 40, height: 3)
        self.size = size
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody?.pinned = true
        self.physicsBody?.friction = 0
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = BitMask.bounceBar
    }
    
    func clone() -> BounceBar{
        return BounceBar(x: self.position.x, y: self.position.y, angle: self.angle)
    }
    
    func print() -> String{
        return "BounceBar(x: \(self.position.x), y: \(self.position.y), angle: \(self.angle)),"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class SolidBar: Bar {
    var barSize: BarSize
    
    init(x: CGFloat, y: CGFloat, angle: Angle, size: BarSize) {
        self.barSize = size
        super.init(x: x, y: y, angle: angle, color: .white)
        self.size = getSize(barSize: size)
        setColor(color: .darkGray)
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.pinned = true
        self.physicsBody?.friction = 0
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = BitMask.solidBar
    }
    
    func getSize(barSize: BarSize) -> CGSize{
        var barWidth: CGFloat!
        switch barSize {
            case .small: barWidth = 80
            case .medium: barWidth = 150
            case .large: barWidth = 200
        }
        return CGSize(width: barWidth, height: 10)
    }
    
    func clone() -> SolidBar{
        return SolidBar(x: self.position.x, y: self.position.y, angle: self.angle, size: self.barSize)
    }
    
    func changeSize() {
        switch barSize {
        case .small:
            self.size = getSize(barSize: .medium)
            self.barSize = .medium
        case .medium:
            self.size = getSize(barSize: .large)
            self.barSize = .large
        case .large:
            self.size = getSize(barSize: .small)
            self.barSize = .small
        }
    }
    
    func print() -> String{
        return "SolidBar(x: \(self.position.x), y: \(self.position.y), angle: \(self.angle), size: \(self.barSize)),"
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BreakBar: SolidBar {
    
    var hardness: Int = 0
    var barColors: [UIColor] = [.yellow, .orange, .red, .purple, .blue, .green, .brown]
    
    init(x: CGFloat, y: CGFloat, angle: Angle, size: BarSize, hardness: Int) {
        self.hardness = hardness
        super.init(x: x, y: y, angle: angle, size: size)
        setColor(color: barColors[hardness])
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.categoryBitMask = BitMask.breakBar
        
    }
    
    override func clone() -> BreakBar {
        return BreakBar(x: self.position.x, y: self.position.y, angle: self.angle, size: self.barSize, hardness: self.hardness)
    }

    
    func changeHardness(direction: direction) {
        switch direction {
        case .up:
            
            if (barColors.indices.contains(hardness+1) == true){
                hardness += 1
                let nextColor = barColors[hardness]
                setColor(color: nextColor)
            }else{
                hardness = 0
                setColor(color: barColors[hardness])
            }
            
        case .down:
            if (barColors.indices.contains(hardness-1) == true){
                hardness -= 1
                let nextColor = barColors[hardness]
                setColor(color: nextColor)
            }else{
                hardness = barColors.count - 1
                setColor(color: barColors[hardness])
            }
            
        default:
            break
        }
    }
    
    override func print() -> String{
        return "BreakBar(x: \(self.position.x), y: \(self.position.y), angle: \(self.angle), size: \(self.barSize), hardness: \(self.hardness)),"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


