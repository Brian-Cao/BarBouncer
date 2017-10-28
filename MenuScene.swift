//
//  MenuScene.swift
//  BounceBar
//
//  Created by Brian Cao on 9/18/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit
import UIKit

class MenuScene: SKScene
{

    override func didMove(to view: SKView)
    {
        screenSize = CGSize(width: self.frame.width, height: self.frame.height)
        self.backgroundColor = menuSceneBackgroundColor
        
        let numberOfPages = Int(Double(levelDataArray.count/30).rounded(FloatingPointRoundingRule.up))
        
        // Might need to move to did load
        for page in 0...numberOfPages - 1
        {
            var arrayOfButtons: Array<LevelButton> = []
            var currentLevelNumber: Int!
            
            
            //Fills arrayOfLevels to 30
            for row in 0...5
            {
                for col in 0...4
                {
                    currentLevelNumber = 30*page+(5*row + col+1)
                    let button = LevelButton(x: CGFloat(-240 + 120 * col), y: CGFloat(180 - 120 * row), levelNumber: currentLevelNumber)
                    //Appends current level
                    arrayOfButtons.append(button)
                }
            }
            
            //Inputs current arrayOfLevels to make an instance of a SelectScene and then appends that scene to levelSelectScenesArray
            
            levelSelectScenes.append(LevelSelectScene(buttonsArray: arrayOfButtons))
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for touch in touches
        {
            let location = touch.location(in: self)
            let touchedNode = self.atPoint(location)
            
            if let nodeName = touchedNode.name
            {
                
                switch nodeName
                {
                case "PlayButton":
                    //Goes to the first levelSelectScene instance
                    let nextScene = levelSelectScenes[0]
                    nextScene.scaleMode = .aspectFit
                    self.scene?.view?.presentScene(nextScene, transition: SKTransition.fade(withDuration: 0.28))
                    
                default:
                    break
                }
            }
        }
    }
    
  
    
}
