//
//  LevelSelectPageViewController.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/26/18.
//  Copyright © 2018 Brian Cao. All rights reserved.
//

import UIKit

class LevelSelectPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var viewControllerList: [UIPageViewController] = {
        
        let sb = UIStoryboard(name:"Main", bundle: nil)
        
        let vc1
        
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
