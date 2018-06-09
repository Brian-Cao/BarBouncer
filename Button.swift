//
//  Button.swift
//  BarBouncer
//
//  Created by Brian Cao on 5/23/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit


class LevelButtonCell: UICollectionViewCell {


    @IBOutlet weak var buttonView: UIButton!
    lazy var level = Int((self.buttonView.titleLabel?.text)!)!
    
    @IBAction func levelButtonTouchUpInside(_ sender: Any) {
        selectedLevel = level
        
    }

    

}
