//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var playGame = storyBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyLabel.text = playGame.getStoryLabelText()
        choice1Button.setTitle(playGame.getChoice1Button(), for: .normal)
        choice2Button.setTitle(playGame.getChoice2Button(), for: .normal)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let choice = sender.currentTitle!
        
        playGame.nextStory(userChoice: choice)
        
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = playGame.getStoryLabelText()
        choice1Button.setTitle(playGame.getChoice1Button(), for: .normal)
        choice2Button.setTitle(playGame.getChoice2Button(), for: .normal)
    }
    
}

