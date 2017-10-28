//
//  Lvl3Scene.swift
//  ball to end
//
//  Created by Brian Cao on 5/5/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit

/*class Lvl1Scene: SKScene, SKPhysicsContactDelegate{
    
    let end =  EndZone  (x: 0, y:  0)
    var ball = Ball     ()
    let bar1 = BounceBar(x: 0, y: -200, angle: angle.flat)
    let bar2 = Bar(x: 0, y: -500, angle: angle.flat, size: barSize.small)
    
    let initX:CGFloat = 0
    let initY:CGFloat = -275
    let initD = direction.down
    
    override func didMove(to view: SKView){
        self.physicsWorld.contactDelegate = self
        addBorder(scene: self)
        
        //adding sprites to scene
        ball = Ball(x: initX, y: initY, diameter: 25, speed: 12)
        addChild(ball)
        addChild(bar1)
        addChild(bar2)
        addChild(end)

        
        ball.move(direction: initD)
    }
    
    //This stuff should be the same for every lvl (1 change is needed in didBegin func for lvl completion)
    func didBegin(_ contact: SKPhysicsContact) {
        let firstBody = contact.bodyA
        let secondBody = contact.bodyB
        
        if(contactBetween(node1: firstBody, node2: secondBody, bitmask1: BitMask.ball, bitmask2: BitMask.endZone)){
            levelArray[0].IsComplete()
            moveTo(scene: "MenuScene")
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
    
}*/
