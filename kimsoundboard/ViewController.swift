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
        
        label.frame = self.view.frame
        label.font = label.font.fontWithSize(40)
        label.textAlignment = .Center;
        self.view.addSubview(label)
        
        for each in allSounds.keys {
            remainingSounds.append(each)
        }
    }
    
    let label = UILabel()
    
    func textPopup (string:String) {
        label.text = string
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.label.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(2.0, delay: 1.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.label.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
        })
                
    }
    
    
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        textPopup("woah")
        
        button.enabled = false
        _ = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(self.enableButton), userInfo: nil, repeats: false)
        
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
    
    func enableButton() {
        button.enabled = true
    }
    
    var remainingSounds = [String]()
    var allSounds:[String:String?] = [
        "beautiful.mp3":"You are beautiful!",
        "awesome.mp3":"You are awesome!",]

}

