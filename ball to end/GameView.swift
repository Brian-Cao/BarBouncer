//
//  GameView.swift
//  BarBouncer
//
//  Created by Brian Cao on 6/28/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit
import SpriteKit

class GameView: SKView, SKPhysicsContactDelegate {

    override func didMoveToSuperview() {
        let levelScene = LevelScene(levelNumber: 1)
        levelScene.scaleMode = .aspectFill
        presentScene(levelScene)
    }
    
}
