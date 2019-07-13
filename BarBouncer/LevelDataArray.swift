//
//  LevelDataArray.swift
//  BarBouncer
//
//  Created by Brian Cao on 5/14/19.
//  Copyright © 2019 Brian Cao. All rights reserved.
//

import Foundation

var levelDataArray: [GameData] = [
GameData(ball: (Ball(x: 0.0, y: 30.0, moveDirection: .up, force: 0.4)), endZone: (EndZone(x: 0.0, y: 120.0)), bounceBars: [BounceBar(x: 0.0, y: 70.0, angle: .flat),], solidBars: [SolidBar(x: 0.0, y: -40.00000762939453, angle: .flat, size: .small),], breakBars: []),
    GameData(ball: (Ball(x: 6.000001907348633, y: 30.0, moveDirection: .up, force: 0.4)), endZone: (EndZone(x: -100.0, y: 90.0)), bounceBars: [BounceBar(x: -1.3452465257518244e-41, y: 90.0, angle: .right),], solidBars: [SolidBar(x: 100.0, y: 90.0, angle: .straight, size: .small),SolidBar(x: 0.0, y: -20.000003814697266, angle: .flat, size: .small),]),
    GameData(ball: Ball(x: 0, y: 0, moveDirection: .up), endZone: EndZone(x: 0, y: 100), bounceBars: [BounceBar(x: 100, y: 100, angle: .right)]),
    GameData(ball: Ball(x: 0, y: 0, moveDirection: .up), endZone: EndZone(x: 0, y: 100), bounceBars: [BounceBar(x: 100, y: 100, angle: .right)]),
    GameData(ball: Ball(x: 0, y: 0, moveDirection: .up), endZone: EndZone(x: 0, y: 100), bounceBars: [BounceBar(x: 100, y: 100, angle: .right)]),
    GameData(ball: Ball(x: 0, y: 0, moveDirection: .up), endZone: EndZone(x: 0, y: 100), bounceBars: [BounceBar(x: 100, y: 100, angle: .right)]),
    GameData(ball: Ball(x: 0, y: 0, moveDirection: .up), endZone: EndZone(x: 0, y: 100), bounceBars: [BounceBar(x: 100, y: 100, angle: .right)]),
    
]
