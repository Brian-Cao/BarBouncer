//
//  LevelScene.swift
//  BarBouncer
//
//  Created by Brian Cao on 5/14/19.
//  Copyright © 2019 Brian Cao. All rights reserved.
//

import Foundation
import SpriteKit

class LevelScene: SKScene{
    
    var ball: Ball
    var endZone: EndZone
    var bounceBars: [BounceBar]
    var solidBars: [SolidBar]
    var breakBars: [BreakBar]
    
    init(gameData: GameData){
        self.ball = gameData.ball
        self.endZone = gameData.endZone
        self.bounceBars = gameData.bounceBars
        self.solidBars = gameData.solidBars
        self.breakBars = gameData.breakBars
        
        super.init(size: UIScreen.main.bounds.size)
        
    }
    
    func updateBarPositions(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
