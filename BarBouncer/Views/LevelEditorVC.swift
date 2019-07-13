//
//  LevelEditorVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 7/26/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit
import SpriteKit

class LevelEditorVC: UIViewController{
    
    
    var levelNumber: Int?
    var levelEditor: LevelEditor
    
    init(gameData: GameData){
        self.levelEditor = LevelEditor(gameData: gameData)
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(levelNumber: Int){
        self.init(gameData: levelDataArray[levelNumber])
        self.levelNumber = levelNumber
    }
    
    var editorView: SKView = {
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

    var bounceBarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addBounceBar(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func addBounceBar(sender: UIButton!){
        levelEditor.addBar(bar: BounceBar(x: 0, y: -150, angle: .right))
    }
    
    var solidBarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addSolidBar(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func addSolidBar(sender: UIButton!){
        levelEditor.addBar(bar: SolidBar(x: 0, y: -150, angle: .right, size: .small))
    }
    
    var breakBarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addBreakBar(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func addBreakBar(sender: UIButton!){
        levelEditor.addBar(bar: BreakBar(x: 0, y: -150, angle: .right, size: .small, hardness: 0))
    }
    
    var runButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(runButtonAction(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func runButtonAction(sender: UIButton!){
        runLevel(gameData: levelEditor.gameData)
    }
    
    var printGameDataButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(printGameData(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func printGameData(sender: UIButton!){
        print(levelEditor.gameData.printData())
    }
    
    var deleteBarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteSelectedBar(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func deleteSelectedBar(sender: UIButton!){
        if levelEditor.lastSelectedObject is Bar {
            let bar: SKSpriteNode! = levelEditor.lastSelectedObject
            bar.removeAllChildren()
            bar.removeFromParent()
            levelEditor.updateGameData()
        }
    }
    
    var saveEditedLevelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveEditedLevel(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func saveEditedLevel(sender: UIButton!){
        let data = levelEditor.gameData.clone()
        let encodedGameData = NSKeyedArchiver.archivedData(withRootObject: data)
        let userDefaults = UserDefaults.standard
        userDefaults.set(encodedGameData, forKey: Keys.savedEditedLevels)
        
    }
    
    var returnLastSavedEditedLevelButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(returnLastSavedLevel(sender:)), for: .touchUpInside)
        return button
    }()
    @objc func returnLastSavedLevel(sender: UIButton!){
        let decodedGameData = UserDefaults.standard.object(forKey: Keys.savedEditedLevels) as! Data
        let lastSavedLevelsGameData = NSKeyedUnarchiver.unarchiveObject(with: decodedGameData) as! GameData
        levelEditor = LevelEditor(gameData: lastSavedLevelsGameData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(editorView)
        self.view.addSubview(backButton)
        
        self.view.addSubview(bounceBarButton)
        self.view.addSubview(solidBarButton)
        self.view.addSubview(breakBarButton)
        
        self.view.addSubview(runButton)
        self.view.addSubview(printGameDataButton)
        self.view.addSubview(deleteBarButton)
        
        self.view.addSubview(saveEditedLevelButton)
        self.view.addSubview(returnLastSavedEditedLevelButton)
        
        setUpLayouts()
        if(levelNumber != nil){
            presentEditorWith(levelNumber: levelNumber!)
        }else{
            runLevel(gameData: levelEditor.gameData)
        }
    }
    
    private func setUpLayouts(){
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        bounceBarButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bounceBarButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        bounceBarButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        bounceBarButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
        solidBarButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        solidBarButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        solidBarButton.leadingAnchor.constraint(equalTo: bounceBarButton.trailingAnchor, constant: 16).isActive = true
        solidBarButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        breakBarButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        breakBarButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        breakBarButton.leadingAnchor.constraint(equalTo: solidBarButton.trailingAnchor, constant: 16).isActive = true
        breakBarButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        runButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        runButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        runButton.leadingAnchor.constraint(equalTo: breakBarButton.trailingAnchor, constant: 16).isActive = true
        runButton.topAnchor.constraint(equalTo: breakBarButton.topAnchor).isActive = true
        
        printGameDataButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        printGameDataButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        printGameDataButton.leadingAnchor.constraint(equalTo: runButton.trailingAnchor, constant: 16).isActive = true
        printGameDataButton.topAnchor.constraint(equalTo: runButton.topAnchor).isActive = true
        
        deleteBarButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        deleteBarButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        deleteBarButton.leadingAnchor.constraint(equalTo: breakBarButton.trailingAnchor, constant: 16).isActive = true
        deleteBarButton.topAnchor.constraint(equalTo: runButton.bottomAnchor).isActive = true
        
        saveEditedLevelButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        saveEditedLevelButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        saveEditedLevelButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        saveEditedLevelButton.bottomAnchor.constraint(equalTo: bounceBarButton.topAnchor, constant: -16).isActive = true
        
        returnLastSavedEditedLevelButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        returnLastSavedEditedLevelButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        returnLastSavedEditedLevelButton.leadingAnchor.constraint(equalTo: saveEditedLevelButton.trailingAnchor, constant: 16).isActive = true
        returnLastSavedEditedLevelButton.bottomAnchor.constraint(equalTo: solidBarButton.topAnchor, constant: -16).isActive = true
    }
    
    func hideEditButtons() {
        runButton.isHidden = true
        bounceBarButton.isHidden = true
        solidBarButton.isHidden = true
        breakBarButton.isHidden = true
        printGameDataButton.isHidden = true
        deleteBarButton.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LevelEditorVC: EditorPresentingDelegate {
    func showEditButtons(){
        runButton.isHidden = false
        bounceBarButton.isHidden = false
        solidBarButton.isHidden = false
        breakBarButton.isHidden = false
        printGameDataButton.isHidden = false
        deleteBarButton.isHidden = false
    }
    func runLevel(gameData: GameData) {
        let newScene = LevelScene(gameData: gameData)
        newScene.playerIsEditing = true
        newScene.editorPresentingDelegate = self
        hideEditButtons()
        
        editorView.presentScene(newScene)
    }
    func runLevel(levelNumber: Int) {
        let newScene = LevelScene(levelNumber: levelNumber)
        newScene.playerIsEditing = true
        hideEditButtons()
        newScene.editorPresentingDelegate = self
        editorView.presentScene(newScene)
    }
    func presentEditorWith(levelNumber: Int) {
        levelEditor = LevelEditor(levelNumber: levelNumber)
        editorView.presentScene(levelEditor)
    }
    func presentEditor(gameData: GameData) {
        levelEditor = LevelEditor(gameData: gameData)
        editorView.presentScene(levelEditor)
    }
    
}
