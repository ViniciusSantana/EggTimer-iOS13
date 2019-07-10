//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var runCount = 60
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func softnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"
        progressBar.progress = 0.0
        timer = timeCountdow(eggTimes[hardness]!)
        
    }
    
    func timeCountdow(_ interval : Int) -> Timer {
         runCount = interval
        
        return Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
           
            self.runCount -= 1
            let progress = Float(interval - self.runCount) / Float(interval)
            self.progressBar.progress = progress
            if self.runCount == 0{
                self.titleLabel.text = "Done!"
                timer.invalidate()
                self.playSound()
            }
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
}
