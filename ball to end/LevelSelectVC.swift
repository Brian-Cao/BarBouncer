//
//  LevelSelectVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/29/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit

class LevelSelectVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: 40, height: 40)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let topGap = (collectionView.frame.height - 265)/32
        let leftGap = (collectionView.frame.width - 220)/2
        layout.sectionInset = UIEdgeInsets(top: topGap, left: leftGap, bottom: topGap, right: leftGap)
        
        layout.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = layout
        

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Setting each cell to be a "GridCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as! LevelCollectionCell
        let cellNumber = (indexPath.section * 30) + (indexPath.item + 1)
        cell.buttonView.setTitle("\(cellNumber)", for: .normal)
        cell.buttonView.tag = cellNumber
        
        return cell
    }
    
    @IBAction func buttonTouched(_ sender: Any) {
        let button = sender as! UIButton
        print(Int((button.titleLabel?.text)!)!)
        
        // Move to Level Scene
        selectedLevel = button.tag
        self.performSegue(withIdentifier: "moveToLevelScene", sender: nil)
        
    }
    
}





