//
//  LvlScene.swift
//  ball to end
//
//  Created by Brian Cao on 6/4/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit

/*class LvlScene: SKScene, SKPhysicsContactDelegate{
    
    let end: EndZone
    var ball: Ball
    let bounceBars: Array<BounceBar>
    let bars: Array<Bar>
    
    let initX:CGFloat
    let initY:CGFloat
    let initD: direction
    
    init(initD: direction, ball: Ball, endZone: EndZone, bounceBars: Array<BounceBar>, bars: Array<Bar>){
        self.initX = ball.position.x
        self.initY = ball.position.y
        self.initD = initD
        self.end = endZone
        self.ball = ball
        self.bounceBars = bounceBars
        self.bars = bars
        super.init()
    }
    
    
    override func didMove(to view: SKView){
        self.physicsWorld.contactDelegate = self
        addBorder(scene: self)
        
        //adding sprites to scene
        addChild(ball)
        addChild(end)
        
        if(bounceBars.count != 0){
            for bar in 0...bounceBars.count - 1{
                addChild(bounceBars[bar])
            }
        }
        if(bars.count != 0){
            for bar in 0...bars.count - 1{
                addChild(bars[bar])
            }
        }
        
        
        ball.move(direction: initD)
    }
    
    //This stuff should be the same for every lvl (1 change is needed in didBegin func for lvl completion)
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        
        if(contactBetween(node1: firstBody, node2: secondBody, bitmask1: BitMask.ball, bitmask2: BitMask.endZone)){
            Lvl1SceneButton.IsComplete()
            moveTo(scene: "MenuScene")
        }
        else if(contactBetween(node1: firstBody, node2: secondBody, bitmask1: BitMask.ball, bitmask2: BitMask.polygon)){
            
        }
    }
    override func update(_ currentTime: TimeInterval){
        if(ball.isTouchingEdge()){
            resetScene()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        for touch in touches {
            let location = touch.location(in: self)
            let node: SKNode = self.atPoint(location)
            tapChecks(node: node, location: location)
        }
    }
    func contactBetween(node1: SKPhysicsBody, node2: SKPhysicsBody, bitmask1: UInt32, bitmask2: UInt32) -> Bool {
        if(node1.categoryBitMask == bitmask1 && node2.categoryBitMask == bitmask2){
            return true
        }
        else if(node1.categoryBitMask == bitmask2 && node2.categoryBitMask == bitmask1){
            return true
        }
        return false
    }
    func moveTo(scene: String){
        let nextScene = SKScene(fileNamed: scene)
        nextScene?.scaleMode = .aspectFill
        self.scene?.view?.presentScene(nextScene!, transition: SKTransition.fade(withDuration: 0.5))
    }
    func tapChecks(node: SKNode, location: CGPoint){
        //reset scene
        if(node.name == "ResetButton"){
            //reset ball
            resetScene()
        }else{
            ball.switchTransparency()
        }
    }
    func resetScene(){
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        ball.position = CGPoint(x: initX, y: initY)
        ball.move(direction: initD)
        if(ball.isOn == false){
            ball.switchTransparency()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}*/
