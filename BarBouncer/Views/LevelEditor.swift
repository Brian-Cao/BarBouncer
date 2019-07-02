//
//  LevelEditor.swift
//  BarBouncer
//
//  Created by Brian Cao on 7/26/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit
import SpriteKit

class LevelEditor: SKScene, SKPhysicsContactDelegate{
    
    var gameData: GameData
    var levelNumber: Int!
    var lastSelectedObject: SKSpriteNode!
    var adjustmentController = SKNode()
    var isFingerOnMoveController = false
    
    init(gameData: GameData) {
        let clonedData = gameData.clone()
        self.gameData = clonedData
        super.init(size: CGSize(width: 375, height: 812))
        self.physicsWorld.contactDelegate = self
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.scaleMode = .aspectFill
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        addObjects(gameData: clonedData)
    }
    
    convenience init(levelNumber: Int){
        self.init(gameData: levelDataArray[levelNumber])
        self.levelNumber = levelNumber
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if let touchedNode = nearestTouchedWithinNodeVicinity(point: location, maximumDistance: 30){
                updateAdjustmentController(selectedObject: touchedNode)
                lastSelectedObject = touchedNode
            }
            else if lastSelectedObject != nil && lastSelectedObject.position.distance(point: location) > 100{
                lastSelectedObject.removeAllChildren()
            }
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
    
            if lastSelectedObject != nil && lastSelectedObject.position.distance(point: location) < 150 && lastSelectedObject.position.distance(point: location) > 100{
                updateMoveController()
            }else{
                isFingerOnMoveController = false
            }
            if(isFingerOnMoveController){
                let newPosition = CGPoint(x: location.x, y: location.y + 130).alignWithTens()
                lastSelectedObject.position = newPosition
            }
        }
    }
    
    func updateMoveController(){
        isFingerOnMoveController = true
        let moveController = Button(x: 0, y: -130, action: {})
        moveController.physicsBody?.collisionBitMask = 0
        adjustmentController.addChild(moveController)
    }
    
    func updateAdjustmentController(selectedObject: SKSpriteNode) {
        
        if lastSelectedObject != nil{
            lastSelectedObject.removeAllChildren()
        }
        
        adjustmentController = SKNode()
        
        switch selectedObject {
        case is Ball:
            addArrows(touchedNode: selectedObject, adjustmentController: adjustmentController)
            addMoveDirectionAdjuster(touchNode: selectedObject, adjustmentController: adjustmentController)
        case is EndZone:
            addArrows(touchedNode: selectedObject, adjustmentController: adjustmentController)
        case is BounceBar:
            addArrows(touchedNode: selectedObject, adjustmentController: adjustmentController)
            addAngleAdjusters(touchedNode: selectedObject, adjustmentController: adjustmentController)
        case is BreakBar:
            addArrows(touchedNode: selectedObject, adjustmentController: adjustmentController)
            addAngleAdjusters(touchedNode: selectedObject, adjustmentController: adjustmentController)
            addSizeAdjuster(touchedNode: selectedObject, adjustmentController: adjustmentController)
            addHardnessAdjuster(touchedNode: selectedObject, adjustmentController: adjustmentController)
        case is SolidBar:
            addArrows(touchedNode: selectedObject, adjustmentController: adjustmentController)
            addAngleAdjusters(touchedNode: selectedObject, adjustmentController: adjustmentController)
            addSizeAdjuster(touchedNode: selectedObject, adjustmentController: adjustmentController)
        
        default:
            break
        }
        
 
        updateAdjustmentControllerAngle(adjustmentController: adjustmentController, touchedNode: selectedObject)
        selectedObject.addChild(adjustmentController)
        
    }
    
    func updateAdjustmentControllerAngle(adjustmentController: SKNode, touchedNode: SKSpriteNode){
        adjustmentController.zRotation = -(touchedNode.zRotation)
    }
    
    func addArrows(touchedNode: SKSpriteNode, adjustmentController: SKNode){
        let upArrow = Button(x: 0, y: 60, action: {touchedNode.position.y += 2})
        upArrow.texture = SKTexture(image: UIImage(named: "BackIconTab")!)
        upArrow.zRotation = -CGFloat(Double.pi/2)
        
        adjustmentController.addChild(upArrow)
        
        let downArrow = Button(x: 0, y: -60, action: {touchedNode.position.y -= 2})
        downArrow.texture = SKTexture(image: UIImage(named: "BackIconTab")!)
        downArrow.zRotation = CGFloat(Double.pi/2)
       
        adjustmentController.addChild(downArrow)
        
        let leftArrow = Button(x: -60, y: 0, action: {touchedNode.position.x -= 2})
        leftArrow.texture = SKTexture(image: UIImage(named: "BackIconTab")!)
        
        adjustmentController.addChild(leftArrow)
        
        let rightArrow = Button(x: 60, y: 0, action: {touchedNode.position.x += 2})
        rightArrow.texture = SKTexture(image: UIImage(named: "BackIconTab")!)
        rightArrow.zRotation = CGFloat(Double.pi)
        
        adjustmentController.addChild(rightArrow)
    }
    
    func addAngleAdjusters(touchedNode: SKSpriteNode, adjustmentController: SKNode){
        let bar = touchedNode as! Bar
        let angleAdjuster = Button(x: 50, y: 50, action: {bar.turn(); self.self.updateAdjustmentControllerAngle(adjustmentController: adjustmentController, touchedNode: touchedNode)})
        //angleAdjuster.size = CGSize(width: 20, height: 20)
        angleAdjuster.texture = SKTexture(image: UIImage(named: "RestartButton")!)
     
        adjustmentController.addChild(angleAdjuster)
    }
    
    func addSizeAdjuster(touchedNode: SKSpriteNode, adjustmentController: SKNode){
        let bar = touchedNode as! SolidBar
        let sizeAdjuster = Button(x: 50, y: -50, action: {bar.changeSize()})
        
        adjustmentController.addChild(sizeAdjuster)
    }
    
    func addMoveDirectionAdjuster(touchNode: SKSpriteNode, adjustmentController: SKNode){
        let ball = touchNode as! Ball
        var moveDirectionAdjuster = Button(x: 50, y: 50, action: {turnMoveDirectionAdjuster()})
        moveDirectionAdjuster.texture = SKTexture(image: UIImage(named: "BackIconTab")!)
        switch ball.moveDirection {
        case .up:
            moveDirectionAdjuster.zRotation = -CGFloat.pi/2
        case .right:
            moveDirectionAdjuster.zRotation = -CGFloat.pi
        case .down:
            moveDirectionAdjuster.zRotation = -CGFloat.pi * (3/2)
        case .left:
            break
        }
        func turnMoveDirectionAdjuster(){
            ball.changeMoveDirection()
            moveDirectionAdjuster.zRotation -= CGFloat.pi/2
        }
       
        adjustmentController.addChild(moveDirectionAdjuster)
    }
    
    func addHardnessAdjuster(touchedNode: SKSpriteNode, adjustmentController: SKNode){
        let bar = touchedNode as! BreakBar
        let sizeAdjuster = Button(x: -50, y: -50, action: {bar.changeHardness(direction: .up)})
        
        adjustmentController.addChild(sizeAdjuster)
    }
    
    func addObjects(gameData: GameData){
        for bar in gameData.bounceBars{
            bar.physicsBody?.collisionBitMask = 0
            addChild(bar)
        }
        for bar in gameData.solidBars{
            bar.physicsBody?.collisionBitMask = 0
            addChild(bar)
        }
        for bar in gameData.breakBars{
            bar.physicsBody?.collisionBitMask = 0
            addChild(bar)
        }
        gameData.endZone.physicsBody?.collisionBitMask = 0
        addChild(gameData.endZone)
        
        gameData.ball.physicsBody?.collisionBitMask = 0
        addChild(gameData.ball)
    }
    
    func addBar(bar: Bar){
        addChild(bar)
        switch bar {
        case is BounceBar:
            gameData.bounceBars.append(bar as! BounceBar)
        case is SolidBar:
            gameData.solidBars.append(bar as! SolidBar)
        case is BreakBar:
            gameData.breakBars.append(bar as! BreakBar)
        default:
            break
        }
    }
    
    func updateGameData(){
        gameData.bounceBars.removeAll()
        gameData.solidBars.removeAll()
        gameData.breakBars.removeAll()
        for child in self.children{
            switch child{
            case is BounceBar:
                gameData.bounceBars.append(child as! BounceBar)
            case is SolidBar:
                gameData.solidBars.append(child as! SolidBar)
            case is BreakBar:
                gameData.breakBars.append(child as! BreakBar)
            default:
                break
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CGPoint {
    func distance(point: CGPoint) -> CGFloat {
        return CGFloat(hypotf(Float(point.x - self.x), Float(point.y - self.y)))
    }
    func alignWithTens() -> CGPoint{
        let newX = 10 * Int(round(self.x / 10.0))
        let newY = 10 * Int(round(self.y / 10.0))
        return CGPoint(x: newX, y: newY)
    }
}

extension SKScene {
    func nearestTouchedWithinNodeVicinity(point: CGPoint, maximumDistance: CGFloat) -> SKSpriteNode? {
        var node: SKSpriteNode?
        var closestDistanceFromNode = maximumDistance
        for child in children {
            if(child is SKSpriteNode){
                let distanceFromPointNode = point.distance(point: child.position)
                if(distanceFromPointNode < closestDistanceFromNode){
                    closestDistanceFromNode = distanceFromPointNode
                    node = child as? SKSpriteNode
                }
            }
        }
        return node
    }
}

