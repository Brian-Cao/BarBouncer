//
//  LevelSelectVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/29/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit

class LevelSelectVC: UIViewController{
    
    @IBOutlet weak var levelGridCollectionView: UICollectionView!

    
//    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//
//        // Setting each gridCell's delegate to self (LevelSelectSceneVC) just before the cell is displayed "willDisplay"
//
//        guard let gridCell = cell as? LevelGridCollectionViewCell else { return }
//
//        gridCell.setCollectionViewDataSourceDelegate(delegate: self, forRow: indexPath.row)
//
//    }
    
}

extension LevelSelectVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Setting number of Sections
        
        return 5
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Setting each cell to be a "GridCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as! LevelGridCollectionViewCell
        
        return cell
        
    }
}


