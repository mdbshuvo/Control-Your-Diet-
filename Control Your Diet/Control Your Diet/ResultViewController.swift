//
//  ResultViewController.swift
//  Control Your Diet
//
//  Created by Badiuzzaman Shuvo on 30/10/19.
//  Copyright © 2019 Badiuzzaman Shuvo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var idealWeightLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var bmiTitleLabel: UILabel!
    var bmi = 0.0
    var idealWeight = 0.0
    var name = ""
    var category = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bmiLabel.text = String(format : "%.2f",bmi)
        idealWeightLabel.text = String(format : "%.2f",idealWeight)
        
        welcomeLabel.text = "Hi \(name), You are "
        
        if bmi > 25 {
             welcomeLabel.text = welcomeLabel.text! + "Overweight!! \nIt's time for a run !!"
            welcomeLabel.textColor = UIColor.red
            bmiLabel.textColor = UIColor.red
            bmiTitleLabel.textColor = UIColor.red
            category = 2
        }
        else if bmi >= 18.5 {
            welcomeLabel.text = welcomeLabel.text! + "Normal !! \nKeep up the pace !!"
            category = 1
        }
        else {
            welcomeLabel.text = welcomeLabel.text! + "Underweight!! \nIt's time to grab a bite !!"
            welcomeLabel.textColor = UIColor.red
            bmiLabel.textColor = UIColor.red
            bmiTitleLabel.textColor = UIColor.red
            category = 0
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let viewController = segue.destination as? FoodViewController {
            viewController.category = self.category
        }
        else if let viewController = segue.destination as? ExercizeViewController {
            viewController.category = self.category
        }
        
    }

}
