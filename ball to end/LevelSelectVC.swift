//
//  LevelSelectVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/29/18".
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit

class LevelSelectVC: UIViewController{
   
    static var furthestLevelCompleted: Int = 0
    var collectionView: UICollectionView!
    let levelCellID = "LevelCell"
    
    var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "BackIconTab"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToHomeScene(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func moveToHomeScene(sender: UIButton!){
        let nextViewController = HomeVC()
        self.present(nextViewController, animated:false, completion:nil)
    }
    
    var levelsTitle: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Levels"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = standardGreyBackgroundColor
        
        let collectionViewLayout: UICollectionViewFlowLayout = {
            let layout =  UICollectionViewFlowLayout()
            let topGap = (self.view.frame.height - 265)/32
            let sideSpacing: CGFloat = UIScreen.main.bounds.width / 5.5
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 5
            let numberOfColumns: CGFloat = 5
            let itemSideLength = (UIScreen.main.bounds.width - ((sideSpacing * 2) + (layout.minimumInteritemSpacing * (numberOfColumns - 1))))/numberOfColumns
            layout.itemSize = CGSize(width: itemSideLength, height: itemSideLength)
            layout.sectionInset = UIEdgeInsets(top: topGap, left: sideSpacing, bottom: topGap, right: sideSpacing)
            layout.scrollDirection = .vertical
            return layout
        }()
        
        collectionView = UICollectionView(frame: self.view.safeAreaLayoutGuide.layoutFrame, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(LevelCollectionCell.self, forCellWithReuseIdentifier: levelCellID)
        self.view.addSubview(collectionView)
        self.view.addSubview(backButton)
        self.view.addSubview(levelsTitle)
        setUpLayouts()
    }
    
    private func setUpLayouts(){
        levelsTitle.heightAnchor.constraint(equalToConstant: 52).isActive = true
        levelsTitle.widthAnchor.constraint(equalToConstant: 140).isActive = true
        levelsTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        levelsTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc func moveToLevelSelectScene(sender: UIButton!){
        let nextViewController = LevelSceneVC()
        
        let selectedLevel = Int((sender.titleLabel?.text)!)
        nextViewController.selectedLevelNumber = selectedLevel!
        self.present(nextViewController, animated:false, completion:nil)
    }
    
}

extension LevelSelectVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellNumber = (indexPath.section * 30) + (indexPath.item + 1)
        let cell: LevelCollectionCell! = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as? LevelCollectionCell
        cell.buttonView.setTitle("\(cellNumber)", for: .normal)
        cell.tag = cellNumber
        if(cellNumber <= LevelSelectVC.furthestLevelCompleted){
            cell.setToComplete()
        }
        return cell
    }
    
}

class LevelCollectionCell: UICollectionViewCell {
    
    var isComplete = false
    var buttonView: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.buttonView = UIButton(frame: frame)
        self.buttonView.translatesAutoresizingMaskIntoConstraints = false
        self.buttonView.backgroundColor = .red
        self.buttonView.layer.cornerRadius = 5
        self.buttonView.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 21)
        self.buttonView.isUserInteractionEnabled = true
        self.buttonView.addTarget(LevelSelectVC(), action: #selector(LevelSelectVC.moveToLevelSelectScene(sender:)), for: .touchUpInside)
        self.addSubview(buttonView)
        setUpLayouts()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        buttonView.backgroundColor = .red
    }
    
    private func setUpLayouts(){
        buttonView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        buttonView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        buttonView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setToComplete() {
        buttonView.backgroundColor = UIColor.green
        isComplete = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


