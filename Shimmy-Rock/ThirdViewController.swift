//
//  ThirdViewController.swift
//  Shimmy-Rock
//
//  Created by Michael Solimini on 2/18/17.
//  Copyright © 2017 Alpha Dev. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ThirdViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var BannerAdView: GADBannerView!
    @IBOutlet weak var InstagramBtn: UIButton!
    @IBOutlet weak var TWTBtn: UIButton!
    @IBOutlet weak var MainPic: UIImageView!
    @IBOutlet weak var FBBten: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        InstagramBtn.layer.cornerRadius = 10.0
        TWTBtn.layer.cornerRadius = 10.0
        MainPic.layer.cornerRadius = 10.0
        FBBten.layer.cornerRadius = 10.0
        
        BannerAdView.isHidden = true
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        BannerAdView.delegate = self
        BannerAdView.adUnitID = "ca-app-pub-5148450448880930/5930154200"
        BannerAdView.rootViewController = self
        BannerAdView.load(request)
        
    }
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        BannerAdView.isHidden = false
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        BannerAdView.isHidden = true
    }

    
    @IBAction func InstagramPressed(_ sender: Any) {
        if UIApplication.shared.canOpenURL(NSURL(string: "instagram://user?username=shimmy_rock")! as URL) {
            UIApplication.shared.openURL(NSURL(string: "instagram://user?username=shimmy_rock")! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: "https://www.instagram.com/shimmy_rock/")! as URL)
    }
}
    
    @IBAction func TwitterPressed(_ sender: Any) {
        if UIApplication.shared.canOpenURL(NSURL(string: "twitter://user?screen_name=shimmy_rock")! as URL) {
            UIApplication.shared.openURL(NSURL(string: "twitter://user?screen_name=shimmy_rock")! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: "https://twitter.com/shimmy_rock")! as URL)
    }
    
    }
    
    @IBAction func FacebookPressed(_ sender: Any) {
        if UIApplication.shared.canOpenURL(NSURL(string: "fb://profile/1369598879727674/")! as URL) {
            UIApplication.shared.openURL(NSURL(string: "fb://profile/1369598879727674/")! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: "https://www.facebook.com/Shimmy-Rock-1369598879727674/")! as URL)
        }
    }
   

}
