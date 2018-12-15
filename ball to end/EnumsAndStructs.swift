//
//  EnumsAndStructs.swift
//  BarBouncer
//
//  Created by Brian Cao on 10/11/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit
import os.log

//var screenSize = CGSize(width: 0, height: 0)
let standardGreyBackgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
//var levelSelectScenes: Array<LevelSelectScene> = []
var furthestCompletedLevel:Int = 0

// Might want to get rid of this later

enum direction {
    case up, down, right, left
}

enum angle {
    case right, left, straight, flat
}

enum barSize {
    case small, medium, large
}

struct BitMask {
    static let bounceBars: UInt32 = 0x1 << 1
    static let ball: UInt32 = 0x1 << 2
    static let endZone: UInt32 = 0x1 << 3
    static let bars: UInt32 = 0x1 << 4
    static let polygon: UInt32 = 0x1 << 5
    static let border: UInt32 = 0x1 << 6
    static let breakBar : UInt32 = 0x1 << 7
    
}

enum roundDirection {
    case up
    case down
}

struct Keys {
    static let furthestCompletedLevel = "furthestCompletedLevel"
    static let savedEditedLevels = "savedEditedLevels"
}



