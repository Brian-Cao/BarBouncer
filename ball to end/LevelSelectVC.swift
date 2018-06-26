//
//  LevelSelectVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/29/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit

class LevelSelectVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Setting each cell to be a "GridCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as! LevelCollectionCell
        cell.buttonView.setTitle("\((indexPath.section * 30) + (indexPath.item + 1))", for: .normal)
        
        return cell
    }
    

}





