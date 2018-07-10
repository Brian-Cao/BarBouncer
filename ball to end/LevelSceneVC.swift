//
//  LevelSceneVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 5/26/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit
import SpriteKit

class LevelSceneVC: UIViewController, LevelPresentingDelegate {
    
    var selectedLevelNumber = 1
    
    var gameView: SKView = {
        var view = SKView()
        view = SKView(frame: UIScreen.main.bounds)
        return view
    }()
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "BackIconTab"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
        return button
    }()
    
    @objc func backButtonAction(sender: UIButton!) {
        self.performSegue(withIdentifier: "MoveToLevelSelectScene", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(gameView)
        self.view.addSubview(backButton)
        
        setUpLayouts()
        
        presentLevel(levelNumber: selectedLevelNumber)
    }
    
    private func setUpLayouts(){
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    func presentLevel(levelNumber: Int) {
        let newScene = LevelScene(levelNumber: levelNumber)
        newScene.presentingDelegate = self
        gameView.presentScene(newScene)
    }
    
}
