//
//  BarFactory.swift
//  BarBouncer
//
//  Created by Brian Cao on 1/3/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import Foundation
import SpriteKit

enum BarType {
    case bounceBar, solidBar, breakBar
}

class BarFactory {
    let barType: BarType
    
    init(barType: BarType) {
        self.barType = barType
    }
    
    
    
}
