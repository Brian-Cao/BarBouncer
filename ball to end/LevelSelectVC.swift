//
//  LevelSelectVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/29/18".
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit

var furthestLevelCompleted: Int = 0

class LevelSelectVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var selectedLevelNumber:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayouts()
        collectionView.collectionViewLayout = layout
    }
    
    private func setUpLayouts(){
        layout.itemSize = CGSize(width: 40, height: 40)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let topGap = (collectionView.frame.height - 265)/32
        let leftGap = (collectionView.frame.width - 220)/2
        layout.sectionInset = UIEdgeInsets(top: topGap, left: leftGap, bottom: topGap, right: leftGap)
        layout.scrollDirection = .vertical
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellNumber = (indexPath.section * 30) + (indexPath.item + 1)
        
        let cell: LevelCollectionCell!
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as? LevelCollectionCell
        cell.buttonView.setTitle("\(cellNumber)", for: .normal)
        cell.buttonView.tag = cellNumber
        
        if(cellNumber <= furthestLevelCompleted){
            cell.setToComplete()
        }
        
        return cell
    }
    
    @IBAction func buttonTouched(_ sender: Any) {
        let button = sender as! UIButton
        selectedLevelNumber = button.tag
        self.performSegue(withIdentifier: "MoveToLevelScene", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "MoveToLevelScene"){
            let nextScene: LevelSceneVC = segue.destination as! LevelSceneVC
            nextScene.selectedLevelNumber = selectedLevelNumber
        }
    }
}





