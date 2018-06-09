//
//  LevelSelectVC.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/29/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit

class LevelSelectVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    

    @IBOutlet weak var levelCollectionView: UICollectionView!
    var levelSet = 0
    var levelCells:[LevelButtonCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemsize = levelCollectionView.bounds.size.width/5 - 12
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemsize, height: itemsize)
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        levelCollectionView.collectionViewLayout = layout

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LevelButtonCell
        let cellNumber = (30*levelSet) + (indexPath.item + 1)
        cell.buttonView.setTitle("\(cellNumber)", for: .normal)
        levelCells.append(cell)
        return cell
    }
    
    
}
