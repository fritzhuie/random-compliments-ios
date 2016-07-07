//
//  ViewController.swift
//  kimsoundboard
//
//  Created by Fritz Huie on 7/6/16.
//  Copyright © 2016 Fritz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for each in allSounds.keys {
            remainingSounds.append(each)
        }
    }
    
    var audioPlayer = AVAudioPlayer()
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        if(remainingSounds.count < 1){
            for each in allSounds.keys {
                remainingSounds.append(each)
            }
        }
        
        let itr = Int(arc4random_uniform(UInt32(allSounds.count)))
        let soundName = remainingSounds[itr]
        //remainingSounds.removeAtIndex(itr)
        
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundName, ofType:nil)!)
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        audioPlayer.play()
    }
    
    var remainingSounds = [String]()
    var allSounds:[String:String?] = [
        "beautiful.mp3":"emily.jpg",
        "awesome.mp3":nil,]

}

