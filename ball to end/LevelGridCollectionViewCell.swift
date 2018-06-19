//
//  LevelGridCollectionView.swift
//  BarBouncer
//
//  Created by Brian Cao on 6/10/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit

// First set of Cells

class LevelGridCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var levelCollectionView: UICollectionView!
    
}

extension LevelGridCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath)
        
        return cell
    }
    

//    func setCollectionViewDataSourceDelegate <D: UICollectionViewDelegate & UICollectionViewDataSource>(delegate: D, forRow row: Int){
//        levelCollectionView.delegate = delegate
//        levelCollectionView.dataSource = delegate
//        levelCollectionView.tag = row
//        levelCollectionView.reloadData()
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath)
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//    }
//
//    var collectionViewOffset: CGFloat {
//        set { levelCollectionView.contentOffset.x = newValue }
//        get { return levelCollectionView.contentOffset.x }
//    }
    
}
