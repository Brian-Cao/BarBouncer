//
//  GameViewController.swift
//  BarBouncer
//
//  Created by Brian Cao on 4/26/17.
//  Copyright © 2017 Brian Cao. All rights reserved.
//

import SpriteKit
import GoogleMobileAds


class HomeVC: UIViewController, GADBannerViewDelegate{
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    var barBouncerTitle: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Title"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var shopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ShopButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return button
    }()
    
    var playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "PlayButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moveToLevelScene), for: .touchUpInside)
        return button
    }()
    
    @objc func moveToLevelScene(sender: UIButton!){
        self.performSegue(withIdentifier: "MoveToLevelScene", sender: nil)
    }
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        self.view.addSubview(barBouncerTitle)
        self.view.addSubview(shopButton)
        self.view.addSubview(playButton)
        
        setUpLayouts()
      
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        bannerView.adUnitID = "ca-app-pub-5829183895281971/3952983924"
        bannerView.rootViewController = self
        bannerView.delegate = self
        bannerView.load(request)
        
    }
    
    private func setUpLayouts(){
        let leadingAndTrailingGap = (UIScreen.main.bounds.width - 240) / 3
        let quarterGapInSafeArea = UIScreen.main.bounds.height * (1/4)
        
        barBouncerTitle.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8).isActive = true
        barBouncerTitle.heightAnchor.constraint(equalTo: barBouncerTitle.widthAnchor, multiplier: 0.7518).isActive = true
        barBouncerTitle.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        barBouncerTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: quarterGapInSafeArea/4).isActive = true
        
        shopButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        shopButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        shopButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: leadingAndTrailingGap).isActive = true
        shopButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -quarterGapInSafeArea).isActive = true
        shopButton.clipsToBounds = true
        shopButton.layer.cornerRadius = 5
        
        playButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        playButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -leadingAndTrailingGap).isActive = true
        playButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -quarterGapInSafeArea).isActive = true
        playButton.clipsToBounds = true
        playButton.layer.cornerRadius = 5
        
    }
    
    override var shouldAutorotate: Bool{
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}



