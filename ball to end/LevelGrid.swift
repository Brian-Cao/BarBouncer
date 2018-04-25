//
//  LevelGrid.swift
//  BarBouncer
//
//  Created by Brian Cao on 12/9/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit


class LevelGrid: SKSpriteNode{
    
    let pageNum: Int
    var levelButtons: [LevelButton] = []
    init(pageNum: Int){
        
        self.pageNum = pageNum
        
        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: 100, height: 100))
        
        var currentButtonNumber: Int!

        for row in 0...5
        {
            for col in 0...4
            {
                currentButtonNumber = 30*pageNum+(5*row + col+1)
                let button = LevelButton(x: CGFloat(-240 + 120 * col), y: CGFloat(220 - 120 * row), buttonNumber: currentButtonNumber)
                if(completedLevels.contains(currentButtonNumber)){
                    button.turnGreen()
                }
                levelButtons.append(button)
                addChild(button)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("hi")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
