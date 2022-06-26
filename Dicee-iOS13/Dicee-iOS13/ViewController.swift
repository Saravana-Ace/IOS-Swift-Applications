//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlet allows me to reference a UI element,
    //in this case an image
    @IBOutlet weak var diceImageOne: UIImageView!
    @IBOutlet weak var diceImageTwo: UIImageView!
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
//        print("Button got tapped.")
//        diceImageOne.image = #imageLiteral(resourceName: "DiceFour")
//        diceImageTwo.image = #imageLiteral(resourceName: "DiceFour")
        let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
        diceImageOne.image = diceArray.randomElement()
        diceImageTwo.image = diceArray[Int.random(in: 0...5)]
    }
}

