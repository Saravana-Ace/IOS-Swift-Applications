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
    let eggTimes = ["Soft": 300, "Medium": 480, "Hard":720]
    var timer = Timer()
    var timeFactor = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var promptBox: UILabel!
    @IBOutlet weak var progBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        //stops the timer from continuing to tick every second
        timer.invalidate()
        
        printTime(solidity: hardness!)
        
    }
    
    func printTime(solidity: String) {
        progBar.progress = 0
        promptBox.text = "\(solidity) timer chosen."
        
        timeFactor = eggTimes[solidity]!
        progBar.progress = Float(1)/Float(timeFactor)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        if (progBar.progress < 1) {
            let update = Float(1)/Float(timeFactor)
            progBar.progress += update
        } else {
            //stops the timer from continuing to tick every second
            timer.invalidate()
            promptBox.text = "Done!"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.promptBox.text = "Press any egg to start a new timer!"
            }
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate()
        progBar.progress = 0
        promptBox.text = "How do you like your eggs?"
    }
}
