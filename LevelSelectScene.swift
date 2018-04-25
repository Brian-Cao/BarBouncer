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
    let pageNum: Int
    let levelGrid: LevelGrid
    
    init(pageNum: Int)
    {
        self.pageNum = pageNum
        self.levelGrid = LevelGrid(pageNum: pageNum)
        
        super.init(size: screenSize)
        
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        //self.backgroundColor = menuSceneBackgroundColor

        addChild(levelGrid)
        
        let title = SKSpriteNode(texture: SKTexture(imageNamed: "Levels"), size: CGSize(width: 350, height: 350))
        title.position = CGPoint(x: -150, y: 460)
        self.addChild(title)
        
        let levelMakerSceneButton = Button(x: 200, y: 400, action: moveToLevelMakerScene)
        addChild(levelMakerSceneButton)
    }
        
    func moveToLevelMakerScene()
    {
        let nextScene = SKScene(fileNamed: "LevelMakerScene")
        nextScene?.scaleMode = .aspectFit
        self.scene?.view?.presentScene(nextScene!, transition: SKTransition.fade(withDuration: 0.28))
    }
    
    func clone() -> LevelSelectScene
    {
        return LevelSelectScene(pageNum: self.pageNum)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
