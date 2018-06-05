//
//  levelMakingScene.swift
//  BarBouncer
//
//  Created by Brian Cao on 7/10/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit
//
//
//var bounceBarArray: Array<BounceBar> = []
//var solidBarArray: Array<SolidBar> = []
//var breakBarArray: Array<BreakBar> = []
//var LMball = Ball(x: 100, y: 0, diameter: 25, speed: 13, moveDirection: .up)
//var LMendZone = EndZone(x: 0, y: 0)
//
//class LevelMakerScene: SKScene {
//    
//    var xPositionLabel = SKLabelNode()
//    var yPositionLabel = SKLabelNode()
//    var upArrow = SKSpriteNode()
//    var downArrow = SKSpriteNode()
//    var leftArrow = SKSpriteNode()
//    var rightArrow = SKSpriteNode()
//    var location: CGPoint!
//    let highLightBars = HighLightBars()
//    var objectIsHeld = false
//    var lastSelectedObject: SKSpriteNode!
//    var lastSelectedBreakBar: BreakBar!
//    
//    override func didMove(to view: SKView) {
//        
//    
//        xPositionLabel = childNode(withName: "xPositionLabel") as! SKLabelNode
//        yPositionLabel = childNode(withName: "yPositionLabel") as! SKLabelNode
//        upArrow = childNode(withName: "upArrow") as! SKSpriteNode
//        downArrow = childNode(withName: "downArrow") as! SKSpriteNode
//        leftArrow = childNode(withName: "leftArrow") as! SKSpriteNode
//        rightArrow = childNode(withName: "rightArrow") as! SKSpriteNode
//        LMball.physicsBody?.collisionBitMask = 0
//        var sceneHasBall = false
//        var sceneHasEndZone = false
//        for child in 0...self.children.count - 1{
//            if(self.children[child] is Ball){
//                sceneHasBall = true
//            }
//            if(self.children[child] is EndZone){
//                sceneHasEndZone = true
//            }
//            
//        }
//        if(sceneHasBall == false){
//            addChild(LMball)
//        }
//        if(sceneHasEndZone == false){
//            addChild(LMendZone)
//        }
//        if(bounceBarArray.count != 0){
//            for bar in 0...bounceBarArray.count - 1  {
//                addChild(bounceBarArray[bar])
//            }
//        }
//        if(solidBarArray.count != 0){
//            for bar in 0...solidBarArray.count - 1  {
//                addChild(solidBarArray[bar])
//            }
//        }
//        if(breakBarArray.count != 0){
//            for bar in 0...breakBarArray.count - 1  {
//                addChild(breakBarArray[bar])
//            }
//        }
//        
//        var nodeArray:Array<SKNode> = []
//        for child in 0...self.children.count - 1{
//            if(self.children[child] is Bar || self.children[child] is EndZone || self.children[child] is Ball){
//                nodeArray.append(self.children[child])
//            }
//        }
//        if(nodeArray.count != 0){
//            for bar in 0...nodeArray.count - 1{
//                if(nodeArray[bar].children.count != 0 ){
//                    nodeArray[bar].removeAllChildren()
//                }
//            }
//        }
//        
//        
//        
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            var barArray: Array<Bar> = []
//            location = touch.location(in: self)
//            var touchedNode: SKNode! = self.atPoint(location)
//            
//            // This gives the node the class/ object that was touched
//            for child in 0...self.children.count - 1{
//                if(self.children[child] is Bar){
//                    barArray.append(self.children[child] as! Bar)
//                }
//            }
//            if(barArray.count != 0){
//                for bar in 0...barArray.count - 1{
//                    if(barArray[bar].contains(location)){
//                        touchedNode = barArray[bar]
//                    }
//                }
//            }
//            if(LMball.contains(location)){
//                touchedNode = LMball
//            }
//            
//           
//            // When the mouse/ finger is moved on to a node when pressed that node is stored to its corresponding value
//            
//            switch "\(touchedNode.classForCoder)"{
//            case "SKSpriteNode":
//                // append desired bar then refresh scene
//                if(touchedNode.name == "bounceBarButton"){
//                    let bar = BounceBar(x: -250, y: -325, angle: .right)
//                    bar.physicsBody?.collisionBitMask = 0
//                    addChild(bar)
//                }
//                else if(touchedNode.name == "barButton"){
//                    let bar = SolidBar(x: -250, y: -325, angle: .right, size: .small)
//                    bar.physicsBody?.collisionBitMask = 0
//                    addChild(bar)
//                }
//                else if(touchedNode.name == "breakBarButton"){
//                    let bar = BreakBar(x: -250, y: -325, hardness: 1, angle: .right, size: .small)
//                    bar.physicsBody?.collisionBitMask = 0
//                    addChild(bar)
//                }
//                else if(touchedNode.name == "upArrow" && lastSelectedObject != nil){
//                    lastSelectedObject.position.y = CGFloat(roundTens(num: lastSelectedObject.position.y, direction: .up))
//                    xPositionLabel.text = "x: \(round(lastSelectedObject.position.x))"
//                    yPositionLabel.text = "y: \(round(lastSelectedObject.position.y))"
//                    
//                }
//                else if(touchedNode.name == "downArrow" && lastSelectedObject != nil){
//                    lastSelectedObject.position.y = CGFloat(roundTens(num: lastSelectedObject.position.y, direction: .down))
//                    xPositionLabel.text = "x: \(round(lastSelectedObject.position.x))"
//                    yPositionLabel.text = "y: \(round(lastSelectedObject.position.y))"
//                    
//                }
//                else if(touchedNode.name == "rightArrow" && lastSelectedObject != nil){
//                    lastSelectedObject.position.x = CGFloat(roundTens(num: lastSelectedObject.position.x, direction: .up))
//                    xPositionLabel.text = "x: \(round(lastSelectedObject.position.x))"
//                    yPositionLabel.text = "y: \(round(lastSelectedObject.position.y))"
//                    
//                }
//                else if(touchedNode.name == "leftArrow" && lastSelectedObject != nil){
//                    lastSelectedObject.position.x = CGFloat(roundTens(num: lastSelectedObject.position.x, direction: .down))
//                    xPositionLabel.text = "x: \(round(lastSelectedObject.position.x))"
//                    yPositionLabel.text = "y: \(round(lastSelectedObject.position.y))"
//                    
//                }
//                else if(touchedNode.name == "trashCan"){
//                    if(lastSelectedObject != nil){
//                        if(lastSelectedObject is Bar){
//                            lastSelectedObject.removeFromParent()
//                        }
//                        
//                    }
//                }
//                else if(touchedNode.name == "printPositionsButton"){
//                    var bounceBarArray: Array<BounceBar> = []
//                    var solidBarArray: Array<SolidBar> = []
//                    var breakBarArray: Array<BreakBar> = []
//                    
//                    for child in 0...self.children.count - 1{
//                        
//                        switch self.children[child] {
//                        case is BounceBar:
//                            bounceBarArray.append(self.children[child] as! BounceBar)
//                        case is BreakBar:
//                            breakBarArray.append(self.children[child] as! BreakBar)
//                        case is SolidBar:
//                            solidBarArray.append(self.children[child] as! SolidBar)
//                            
//                        default:
//                            break
//                        }
//                    }
//                    
//                    var bounceBars = ""
//                    var solidBars = ""
//                    var breakBars = ""
//                    
//                    if bounceBarArray.count != 0{
//                        for bar in 0...bounceBarArray.count - 1{
//                            bounceBars.append(bounceBarArray[bar].printProperties())
//                        }
//                    }
//                    if breakBarArray.count != 0 {
//                        for bar in 0...breakBarArray.count - 1{
//                            breakBars.append(breakBarArray[bar].printProperties())
//                        }
//                    }
//                    if solidBarArray.count != 0{
//                        for bar in 0...solidBarArray.count - 1{
//                            solidBars.append(solidBarArray[bar].printProperties())
//                        }
//                    }
//                    
//                    print("GameData(ball: \(LMball.printProperties()), endZone: \(LMendZone.printProperties()), bounceBars: [\(bounceBars)], solidBars: [\(solidBars)], breakBars: [\(breakBars)])")
//                    
//                    
//                }
//                else if(touchedNode.name == "subtractHardnessButton" && lastSelectedBreakBar != nil){
//                    if(lastSelectedBreakBar == lastSelectedObject){
//                        lastSelectedBreakBar.changeHardness(direction: .down)
//                    }
//                }
//                else if(touchedNode.name == "addHardnessButton" && lastSelectedBreakBar != nil){
//                    if(lastSelectedBreakBar == lastSelectedObject){
//                        lastSelectedBreakBar.changeHardness(direction: .up)
//                    }
//                }
//                else if(touchedNode.name == "sizeButton" && lastSelectedObject != nil){
//                    if(lastSelectedObject is SolidBar){
//                        let bar: SolidBar = lastSelectedObject as! SolidBar
//                        bar.changeSize()
//                    }
//                }
//                else if(touchedNode.name == "runButton"){
//                    bounceBarArray.removeAll()
//                    breakBarArray.removeAll()
//                    solidBarArray.removeAll()
//                    for child in 0...self.children.count - 1{
//                        
//                        switch self.children[child] {
//                        case is BounceBar:
//                            bounceBarArray.append(self.children[child] as! BounceBar)
//                        case is BreakBar:
//                            breakBarArray.append(self.children[child] as! BreakBar)
//                        case is SolidBar:
//                            solidBarArray.append(self.children[child] as! SolidBar)
//                            
//                        default:
//                            break
//                        }
//                    }
//                    
//                    let nextScene = LevelScene(gameData: GameData(ball: LMball, endZone: LMendZone, bounceBars: bounceBarArray, solidBars: solidBarArray, breakBars: breakBarArray))
//                    //nextScene.menuButton.name = "LevelMakerScene"
//                    nextScene.scaleMode = .aspectFit
//                    
//                    self.scene?.view?.presentScene(nextScene, transition: SKTransition.fade(withDuration: 0.5))
//                }
//                else if(touchedNode.name == "ballDirectionButton"){
//                    LMball.changeMoveDirection()
//                    touchedNode.zRotation -= CGFloat(Double.pi / 2)
//                }
//                
//            case "BounceBar", "SolidBar", "BreakBar":
//                let selectedBar = touchedNode as? Bar
//                if(selectedBar == lastSelectedObject){
//                    selectedBar?.turn()
//                }
//                if(lastSelectedObject != nil){
//                    lastSelectedObject.removeAllChildren()
//                }
//                if(touchedNode is BreakBar){
//                    lastSelectedBreakBar = touchedNode as! BreakBar?
//                }
//                lastSelectedObject = touchedNode as! SKSpriteNode
//                lastSelectedObject.addChild(highLightBars)
//                xPositionLabel.text = "x: \(round(lastSelectedObject.position.x))"
//                yPositionLabel.text = "y: \(round(lastSelectedObject.position.y))"
//                
//            case "Ball":
//                if(lastSelectedObject != nil){
//                    lastSelectedObject.removeAllChildren()
//                }
//                lastSelectedObject = touchedNode as! SKSpriteNode
//                lastSelectedObject.addChild(highLightBars)
//                xPositionLabel.text = "x: \(round(lastSelectedObject.position.x))"
//                yPositionLabel.text = "y: \(round(lastSelectedObject.position.y))"
//                
//            case "EndZone":
//                
//                if(lastSelectedObject != nil){
//                    lastSelectedObject.removeAllChildren()
//                }
//                lastSelectedObject = touchedNode as! SKSpriteNode
//                lastSelectedObject.addChild(highLightBars)
//                xPositionLabel.text = "x: \(round(lastSelectedObject.position.x))"
//                yPositionLabel.text = "y: \(round(lastSelectedObject.position.y))"
//            default:
//                break
//            }
//        }
//    }
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches{
//            var barArray: Array<Bar> = []
//            location = touch.location(in: self)
//            var touchedNode: SKNode! = self.atPoint(location)
//            
//            // This gives the node the class/ object that was touched
//            for child in 0...self.children.count - 1{
//                if(self.children[child] is Bar){
//                    barArray.append(self.children[child] as! Bar)
//                }
//            }
//            
//            if(barArray.count != 0){
//                for bar in 0...barArray.count - 1{
//                    if(barArray[bar].contains(location) && objectIsHeld == false){
//                        touchedNode = barArray[bar]
//                        objectIsHeld = true
//                        if(lastSelectedObject != nil){
//                            lastSelectedObject.removeAllChildren()
//                        }
//                        lastSelectedObject = touchedNode as! SKSpriteNode
//                        lastSelectedObject.addChild(highLightBars)
//                        lastSelectedObject.run(SKAction.scale(to: 1.8, duration: 0.25))
//                    }
//                }
//            }
//            
//            if(LMball.contains(location) && objectIsHeld == false){
//                touchedNode = LMball
//                objectIsHeld = true
//                if(lastSelectedObject != nil){
//                    lastSelectedObject.removeAllChildren()
//                }
//                lastSelectedObject = touchedNode as! SKSpriteNode
//                lastSelectedObject.addChild(highLightBars)
//                lastSelectedObject.run(SKAction.scale(to: 1.8, duration: 5))
//            }
//            
//            if(LMendZone.contains(location) && objectIsHeld == false){
//                touchedNode = LMendZone
//                objectIsHeld = true
//                if(lastSelectedObject != nil){
//                    lastSelectedObject.removeAllChildren()
//                }
//                lastSelectedObject = touchedNode as! SKSpriteNode
//                lastSelectedObject.addChild(highLightBars)
//                lastSelectedObject.run(SKAction.scale(to: 1.8, duration: 0.25))
//            }
//            
//            
//            // If one of the selected items gains a value then the seleted item will follow the mouse/ finger
//            if(objectIsHeld){
//                lastSelectedObject.position = location
//                xPositionLabel.text = "x: \(round(lastSelectedObject.position.x))"
//                yPositionLabel.text = "y: \(round(lastSelectedObject.position.y))"
//            }
//            
//            
//        }
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        if(lastSelectedObject != nil){
//            if(lastSelectedObject is Ball){
//                lastSelectedObject.run(SKAction.scale(to: 1, duration: 1))
//            }else{
//                lastSelectedObject.run(SKAction.scale(to: 1, duration: 0.1))
//            }
//        }
//        objectIsHeld = false
// 
//    }
//
//    func roundTens(num: CGFloat, direction: roundDirection) -> Int {
//       
//        var x: Int = Int(round(num))
//        
//        if(direction == roundDirection.up){
//          
//            if(x % 10 == 0){
//                x += 10
//            }else{
//                x = Int(round(Double(x)/10.0 + 0.5) * 10.0)
//            }
//            
//        }
//        else if(direction == roundDirection.down){
//            if(x % 10 == 0){
//                x -= 10
//            }else{
//                x = Int(round(Double(x)/10.0 - 0.5) * 10.0)
//            }
//            
//        }
//        
//        return Int(x)
//    }
//    
//    
//}
