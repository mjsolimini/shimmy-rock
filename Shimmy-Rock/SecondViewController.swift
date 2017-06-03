//
//  SecondViewController.swift
//  Shimmy-Rock
//
//  Created by Michael Solimini on 2/18/17.
//  Copyright © 2017 Alpha Dev. All rights reserved.
//

import UIKit
import WebKit
import GoogleMobileAds

class SecondViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var BannerAdView: GADBannerView!
    @IBOutlet weak var Container: UIView!
    var WebView: WKWebView!
    
    override func viewDidLoad() {
        WebView = WKWebView()
        Container.addSubview(WebView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let frame = CGRect(x: 0, y: 0, width: Container.bounds.width, height: Container.bounds.height)
        WebView.frame = frame
        loadRequest(urlStr: "https://soundcloud.com/justshimmy")
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        BannerAdView.delegate = self
        BannerAdView.adUnitID = "ca-app-pub-5148450448880930/3864018204"
        BannerAdView.rootViewController = self
        BannerAdView.load(request)
    }
    
    func loadRequest(urlStr: String) {
        let url = URL(string: urlStr)!
        let request = URLRequest(url: url)
        WebView.load(request)
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        BannerAdView.isHidden = true
    }


}

