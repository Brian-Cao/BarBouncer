//
//  TriangleClass.swift
//  ball to end
//
//  Created by Brian Cao on 5/6/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit

class Polygon: SKSpriteNode{
    
    @objc init(x: CGFloat, y: CGFloat){
        super.init(texture: SKTexture(imageNamed: "Polygon"), color: UIColor.white, size: CGSize(width: 60, height: 60))
        //super properties
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width/2)
        self.physicsBody?.isDynamic = false
        self.position = CGPoint(x: x, y: y)
            //bitmasking
            self.physicsBody?.categoryBitMask = BitMask.polygon
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
