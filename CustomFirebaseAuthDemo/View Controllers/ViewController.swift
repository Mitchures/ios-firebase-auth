//
//  ViewController.swift
//  CustomFirebaseAuthDemo
//
//  Created by Mitchell Hollander on 4/29/20.
//  Copyright © 2020 Mitchell Hollander. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    
    func setUpVideo() {
        
        // Get the video source path
        let bundlePath = Bundle.main.path(forResource: "tokyoVideo", ofType: "mov")
        
        guard  bundlePath != nil else {
            return
        }
        
        // Create a URL from path
        let url = URL(fileURLWithPath: bundlePath!)
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        // Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        // Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x:
            -self.view.frame.size.width * 1.5, y: 0, width:
            self.view.frame.size.width * 4, height:
            self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        // Display
        videoPlayer?.playImmediately(atRate: 1)
        
    }

    @IBAction func signUpTapped(_ sender: Any) {
    }
    
    @IBAction func loginTapped(_ sender: Any) {
    }
    
}

