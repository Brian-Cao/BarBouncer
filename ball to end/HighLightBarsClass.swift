//
//  HighLightBarsClass.swift
//  BarBouncer
//
//  Created by Brian Cao on 7/21/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit

class HighLightBars: SKSpriteNode{
    
    @objc let highlightBar = SKSpriteNode(texture: nil, color: UIColor.green, size: CGSize(width: 150, height: 15))
    @objc let topHighlightBar = SKSpriteNode(texture: nil, color: UIColor.green, size: CGSize(width: 150, height: 15))

    init(){
        super.init(texture: nil, color: UIColor.clear, size: CGSize())
        highlightBar.position = CGPoint(x: 0, y: -30)
        topHighlightBar.position = CGPoint(x: 0, y: 30)
        addChild(highlightBar)
        addChild(topHighlightBar)
    }
    
    @objc func hasParent() -> Bool {
        if(self.parent == nil){
            return false
        }else{
            return true
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
