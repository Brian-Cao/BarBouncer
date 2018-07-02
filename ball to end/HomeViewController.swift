//
//  GameViewController.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/26/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit
import GoogleMobileAds


class HomeViewController: UIViewController, GADBannerViewDelegate{
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
 
        /*
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        
        // REMOVE BEFORE SUBMITING
        bannerView.isHidden = true
        bannerView.adUnitID = "ca-app-pub-5829183895281971/3952983924"
        
        bannerView.rootViewController = self
        bannerView.delegate = self
        
        bannerView.load(request)
 
        
        if let view = self.view as! SKView? {
           // let scene = UIStoryboard(name: "LauchScreen", bundle: nil)
            // Load the SKScene from 'GameScene.sks'
            let scene = SKScene(fileNamed: "MenuScene")
                // Set the scale mode to scale to fit the window
            
                scene?.scaleMode = .aspectFit
            
                // Present the scene
                view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
     */
        
        
        
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}



