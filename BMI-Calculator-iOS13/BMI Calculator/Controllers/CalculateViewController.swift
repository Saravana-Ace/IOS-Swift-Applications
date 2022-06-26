//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmi : Float = 0.0
    @IBOutlet weak var heightMeter: UILabel!
    @IBOutlet weak var weightKg: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
//        heightMeter.text = String(round(sender.value*100)/100) + "m"
        let height = String(format: "%.2fm", sender.value)
        heightMeter.text = height
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0fKg", sender.value)
        weightKg.text = weight
        //String(Int(sender.value))
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmi = weight/pow(height,2)
       
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //going to be the view controller that will be initialized when the
        //segue gets triggered
        
        //to check that we are on the correct segue, just in case there
        //is more than one ViewController
        if (segue.identifier == "goToResult") {
            //the .destination is the view controller that will be initialized
            //when the segue gets performed
            
            //the as keyword is perfoming downcasting, and the exclamation mark
            //is saying that this is a forced downcast
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = String(format: "%.1f", bmi)
        }
    }
    
}

