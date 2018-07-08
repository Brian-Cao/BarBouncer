//
//  LevelSceneVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 5/26/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit
import SpriteKit

// Not scaling correctly bc it takes the bar size literaly

class LevelSceneVC: UIViewController, LevelPresentingDelegate {
    
    var selectedLevelNumber = 1
    var gameView = SKView()
    var gameScene: LevelScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameView = SKView(frame: UIScreen.main.bounds)
        
        self.view.addSubview(gameView)
        
        presentLevel(levelNumber: selectedLevelNumber)
        
    }
    
    func presentLevel(levelNumber: Int) {
        let newScene = LevelScene(levelNumber: levelNumber)
        newScene.presentingDelegate = self
        gameView.presentScene(newScene)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
