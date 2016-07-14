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
        label.font = UIFont(name: "arial", size: 40)
        label.textAlignment = .Center;
        label.textColor = UIColor.blueColor()
        self.view.addSubview(label)
        bgview.alpha = 0.0
        for each in allSounds.keys {
            remainingSounds.append(each)
        }
    }
    
    let label = UILabel()
    
    func textPopup (string:String?) {
        label.text = string
        UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.label.alpha = 1.0
            self.label.transform = CGAffineTransformMakeScale(2, 2)
            self.label.transform = CGAffineTransformIdentity
            self.button.alpha = 0.0
            self.bgview.alpha = 1.0
            
            }, completion: {
                (finished: Bool) -> Void in
                UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                    self.label.alpha = 0.0
                    self.label.transform = CGAffineTransformMakeScale(6, 6)
                    self.label.transform = CGAffineTransformMakeTranslation(-256, -256)
                    self.label.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                    self.label.transform = CGAffineTransformIdentity
                    self.bgview.alpha = 0.0
                    self.button.alpha = 1.0
                    }, completion: {
                        (finished: Bool) -> Void in
                })
        })
        
    }
    
    
    var audioPlayer = AVAudioPlayer()

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var bgview: UIImageView!
    @IBAction func buttonTapped(sender: UIButton) {
        
        var soundName:String = remainingSounds[0]
        
        if(remainingSounds.count == 1){
            soundName = remainingSounds[0]
            remainingSounds.removeAll()
            for each in allSounds.keys{
                remainingSounds.append(each)
            }
        }else{
            let itr = Int(arc4random_uniform(UInt32(remainingSounds.count)))
            soundName = remainingSounds[itr]
            remainingSounds.removeAtIndex(itr)
        }
        
        textPopup(allSounds[soundName]!)
        
        let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundName, ofType:nil)!)
        audioPlayer = try! AVAudioPlayer(contentsOfURL: url)
        audioPlayer.play()
    }
    
    func enableButton() {
        button.enabled = true
    }
    
    var remainingSounds = [String]()
    var allSounds:[String:String?] = [
        "affection.mp3":"You are beautiful!",
        "assholes.mp3":"You are awesome!",
        "bedhead.mp3":"You are beautiful!",
        "burgers.mp3":"You are awesome!",
        "fabulous.mp3":"You are beautiful!",
        "fuckingbeautiful.mp3":"You are awesome!",
        "killingit.mp3":"You are beautiful!",
        "laugh.mp3":"You are awesome!",
        "loved.mp3":"You are beautiful!",
        "opinions.mp3":"You are awesome!",
        "proud.mp3":"You are beautiful!",
        "shittyday.mp3":"You are awesome!",
        "thelight.mp3":"You are beautiful!",
        "warmestperson.mp3":"You are awesome!",
        "wisdom.mp3":"You are beautiful!"]

}

