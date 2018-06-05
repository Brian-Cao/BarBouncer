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
        cell.buttonView.setTitle("\((30*levelSet) + (indexPath.item + 1))", for: .normal)

        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
