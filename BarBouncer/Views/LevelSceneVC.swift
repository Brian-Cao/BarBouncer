//
//  LevelSceneVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 5/26/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit
import SpriteKit

class LevelSceneVC: UIViewController{
    
    
    var gameData: GameData
    var levelNumber: Int?
    
    init(gameData: GameData){
        self.gameData = gameData
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(levelNumber: Int){
        self.init(gameData: levelDataArray[levelNumber-1])
        self.levelNumber = levelNumber
    }
    
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
    
    var restartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "RestartButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(restartLevel(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func restartLevel(sender: UIButton!){
        presentLevelWith(levelNumber: levelNumber!)
        
    }
    
    var editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToLevelEditor(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func moveToLevelEditor(sender: UIButton!) {
        let nextViewController = LevelEditorVC(levelNumber: levelNumber!)
        self.present(nextViewController, animated:false, completion:nil)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.view.addSubview(gameView)
        self.view.addSubview(backButton)
        self.view.addSubview(restartButton)
        self.view.addSubview(editButton)
        setUpLayouts()

        if(levelNumber != nil){
            presentLevelWith(levelNumber: levelNumber!)
        }else{
            presentLevel(gameData: gameData)
        }
        
    }
    
    private func setUpLayouts(){
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        restartButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        restartButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        restartButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        restartButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        editButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        editButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 66).isActive = true
        editButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LevelSceneVC: LevelPresentingDelegate {
    func presentLevel(gameData: GameData) {
        let newScene = LevelScene(gameData: gameData)
        newScene.levelPresentingDelegate = self
        gameView.presentScene(newScene)
    }
    
    func presentLevelWith(levelNumber: Int) {
        let newScene = LevelScene(levelNumber: levelNumber)
        self.levelNumber = levelNumber
        newScene.levelPresentingDelegate = self
        gameView.presentScene(newScene)
    }
    
    
}
