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
        button.addTarget(self, action: #selector(moveToLevelSelectScene(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func moveToLevelSelectScene(sender: UIButton!){
        let nextViewController = LevelSelectVC()
        self.present(nextViewController, animated:false, completion:nil)
    }
    
    var editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToLevelSelectScene(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func editButtonAction(sender: UIButton!) {
        self.performSegue(withIdentifier: "MoveToLevelSelectScene", sender: nil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.addSubview(gameView)
        self.view.addSubview(backButton)
        self.view.addSubview(editButton)
        setUpLayouts()
        presentLevel(levelNumber: selectedLevelNumber)
    }
    
    private func setUpLayouts(){
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        editButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        editButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 66).isActive = true
        editButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
    }
    
    func presentLevel(levelNumber: Int){
        let newScene = LevelScene(levelNumber: levelNumber)
        newScene.presentingDelegate = self
        gameView.presentScene(newScene)
    }
    
}
