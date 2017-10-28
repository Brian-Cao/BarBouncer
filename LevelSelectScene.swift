//
//  LevelSelectScene.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/29/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit
import UIKit

class LevelSelectScene: SKScene
{
    
    let buttonsArray: Array<LevelButton>
    
    init(buttonsArray: Array<LevelButton>)
    {
        self.buttonsArray = buttonsArray
        
        super.init(size: screenSize)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = menuSceneBackgroundColor

    }
    
    override func didMove(to view: SKView)
    {
        print(completedLevels)
        let title = SKLabelNode(text: "Levels")
        title.fontSize = 95
        title.color = UIColor.white
        title.fontName = "GillSans-SemiBold"
        title.horizontalAlignmentMode = .left
        title.position = CGPoint(x: -325, y: 410)
        self.addChild(title)
        
        addLevels()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            let node:SKNode = self.atPoint(location)           
            
            if(node is LevelButton)
            {
                let levelbutton = node as! LevelButton
                
                if(levelbutton.levelNumber == 1){
                    
                    moveToLevelScene(LevelDataNumber: levelbutton.levelNumber)
                    
                }else if(completedLevels.isEmpty == false){
                    
                    for lvl in 0...completedLevels.count - 1{
                        
                        if(completedLevels[lvl] + 1 ==  levelbutton.levelNumber){
                            
                            moveToLevelScene(LevelDataNumber: levelbutton.levelNumber)
                            
                        }
                        
                    }
                    
                }
                
            }
            
            if(node is SKLabelNode && node.name == "buttonLabel")
            {
                let label = node as! SKLabelNode
                //moveToLevelScene(LevelDataNumber: Int(label.text!)!)
                if let levelNumber: Int = Int(label.text!) {
                    if(levelNumber == 1){
                        
                        moveToLevelScene(LevelDataNumber: levelNumber)
                        
                    }else if(completedLevels.isEmpty == false){
                        
                        for lvl in 0...completedLevels.count - 1{
                            
                            if(completedLevels[lvl] + 1 == levelNumber){
                                
                                moveToLevelScene(LevelDataNumber: levelNumber)
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            if(node is SKSpriteNode && node.name == "levelMakerButton")
            {
                let nextScene = SKScene(fileNamed: "LevelMakerScene")
                nextScene?.scaleMode = .aspectFit
                self.scene?.view?.presentScene(nextScene!, transition: SKTransition.fade(withDuration: 0.28))
            }
        }
    }
    
    func addLevels()
    {
        for button in 0...buttonsArray.count - 1
        {
            self.addChild(buttonsArray[button])
        }
    }
    
    func moveToLevelScene(LevelDataNumber: Int)
    {
        let nextScene = LevelScene(levelNumber: LevelDataNumber)
        nextScene.scaleMode = .aspectFit
        self.scene?.view?.presentScene(nextScene, transition: SKTransition.fade(withDuration: 0.28))
    }
    
    func clone() -> LevelSelectScene
    {
        var array: Array<LevelButton> = []
        for lvl in 0...self.buttonsArray.count - 1 {
            array.append(buttonsArray[lvl].clone())
        }
        return LevelSelectScene(buttonsArray: array)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
