//
//  LevelScene.swift
//  BarBouncer
//
//  Created by Brian Cao on 5/14/19.
//  Copyright © 2019 Brian Cao. All rights reserved.
//

import Foundation
import SpriteKit

protocol LevelPresentingDelegate{
    func presentLevel(gameData: GameData)
    func presentLevelWith(levelNumber: Int)
}

class LevelScene: SKScene {
    
    var levelPresentingDelegate: LevelSceneVC!
    
    var gameData: GameData
    
    var ball: Ball {
        get{return gameData.ball}
    }
    var endZone: EndZone {
        get{return gameData.endZone}
    }
    var bounceBars: [BounceBar] {
        get{return gameData.bounceBars}
    }
    var solidBars: [SolidBar] {
        get{return gameData.solidBars}
    }
    var breakBars: [BreakBar] {
        get{return gameData.breakBars}
    }
    
    var levelNumber: Int?
    var playerHasMovedTheBall = false
    
    init(gameData: GameData){
        self.gameData = gameData.clone()
//        self.ball = gameData.ball
//        self.endZone = gameData.endZone
//
//        self.bounceBars = gameData.bounceBars
//        self.solidBars = gameData.solidBars
//        self.breakBars = gameData.breakBars
        
        super.init(size: UIScreen.main.bounds.size)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        addObjects()
        
    }
    
    convenience init(levelNumber: Int) {
        self.init(gameData: levelDataArray[levelNumber-1])
        self.levelNumber = levelNumber
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches{
            if playerHasMovedTheBall == false{
                ball.applyMoveDirection()
                playerHasMovedTheBall = true
            }else{
                ball.flipTransparency()
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if endZone.contains(ball.position){
            
            print("in endZone")
            if let levelNumber = levelNumber{
                for child in self.children {child.removeFromParent()}
                self.removeAllChildren()
                let nextLevelNumber = levelNumber + 1
                levelPresentingDelegate.presentLevelWith(levelNumber: nextLevelNumber)
                

                
            } else {
                levelPresentingDelegate.presentLevel(gameData: self.gameData)
            }
            
        }
        
        if self.contains(ball.position){}else{
            
        }
    }
    
    func addObjects(){
        addChild(ball)
        addChild(endZone)
        for bar in bounceBars {addChild(bar)}
        for bar in solidBars  {addChild(bar)}
        for bar in breakBars  {addChild(bar)}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



