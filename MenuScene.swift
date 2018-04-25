//
//  MenuScene.swift
//  BarBouncer
//
//  Created by Brian Cao on 9/18/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit
import UIKit
/*
class MenuScene: SKScene
{
   
    override func sceneDidLoad()
    {
        screenSize = CGSize(width: self.frame.width, height: self.frame.height)
        
        self.backgroundColor = menuSceneBackgroundColor
        
        
        super.sceneDidLoad()
        
        let playButton = Button(x: 0, y: -80, action: moveToLevelSelectScene, delay: 125)
        playButton.size = CGSize(width: 160, height: 160)
        playButton.texture = SKTexture(imageNamed: "PlayButton")
        
        addChild(playButton)
        
        if let savedCompletedLevels: Array<Int> = UserDefaults.standard.object(forKey: Keys.completedLevels) as? Array<Int>{
            completedLevels = savedCompletedLevels
        }
        
        var numberOfPages: Int{
            let num: Double = Double(levelDataArray.count)/30.0
            return Int(num.rounded(.up))
        }
        
        for page in 0...numberOfPages - 1
        {
            levelSelectScenes.append(LevelSelectScene(pageNum: page))
        }
        
    }
    
    
    func moveToLevelSelectScene() {
        var nextScene: LevelSelectScene {
            let currentPage = Int(Double(completedLevels.count/30).rounded(.down))
            return levelSelectScenes[currentPage]
        }
        nextScene.scaleMode = .aspectFit
        self.scene?.view?.presentScene(nextScene, transition: SKTransition.fade(withDuration: 0.28))
    }
    
  
    
}
 */
