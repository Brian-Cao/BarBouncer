//
//  SwitchBarClass.swift
//  BarBouncer
//
//  Created by Brian Cao on 1/4/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import Foundation
import SpriteKit

class SwitchBar: SolidBar {
    init(x: CGFloat, y: CGFloat, angle: angle, size: barSize, color: UIColor, switchXpos: CGFloat, switchYpos: CGFloat, switchIsOn: Bool) {
        super.init(x: x, y: y, angle: angle, size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
