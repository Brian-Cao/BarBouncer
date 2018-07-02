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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func didMoveToSuperview() {
        let levelScene = LevelScene(levelNumber: 1)
        levelScene.scaleMode = .aspectFill
        presentScene(levelScene)
    }

    
    
    
    
    
}
