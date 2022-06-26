//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var optOne: UIButton!
    @IBOutlet weak var optTwo: UIButton!
    @IBOutlet weak var optThree: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        //the viewDidLoad function is similar to the main method in Java,
        //they are the first functions to be called
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if (userGotItRight) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //Since this is a timer that just runs once and stops,
        //we don't need to store it in a variable
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        //updating the answer choices here
        optOne.setTitle(quizBrain.getOptionOneText(), for: .normal)
        optTwo.setTitle(quizBrain.getOptionTwoText(), for: .normal)
        optThree.setTitle(quizBrain.getOptionThreeText(), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        optOne.backgroundColor = UIColor.clear
        optTwo.backgroundColor = UIColor.clear
        optThree.backgroundColor = UIColor.clear
    }
}

