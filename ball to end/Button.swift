//
//  Button.swift
//  BarBouncer
//
//  Created by Brian Cao on 12/9/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit

class Button: SKSpriteNode {
    
    var action: () -> Void
    let delay: Int
    
    init(x: CGFloat, y: CGFloat, action: @escaping () -> Void, delay: Int = 0) {
        
        self.action = action
        self.delay = delay
        
        super.init(texture: nil, color: .red, size: CGSize(width: 100, height: 100))
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.position = CGPoint(x: x, y: y)
        self.isUserInteractionEnabled = true
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(SKAction(named: "Shrink")!)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(SKAction(named: "Grow")!)
        
        let deadlineTime = DispatchTime.now() + .milliseconds(delay)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
            self.action()
        })
      
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

