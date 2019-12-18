//
//  InputViewController.swift
//  Control Your Diet
//
//  Created by Badiuzzaman Shuvo on 29/10/19.
//  Copyright © 2019 Badiuzzaman Shuvo. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var feetText: UITextField!
    @IBOutlet weak var inchText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    var bmi = 0.0
    var idealWeight = 0.0
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let name = nameText.text
        let ageStr = ageText.text
        let feetStr = feetText.text
        let inchStr = inchText.text
        let weightStr = weightText.text
        
        if( name == "" || ageStr == "" || feetStr == "" || weightStr == "" ) {
            
            displayAlert(message: "All fields except inch are required")
            return
        }
        
        let age = Int(ageStr!)
        let feet = Int(feetStr!)
        let inch = Int(inchStr!)
        let weight = Double(weightStr!)
        
        //print("age = \(age!) , height = \(height!) , weight = \(weight!)")
        
        if( age == nil || feet == nil || weight == nil ) {
            displayAlert(message: "Please insert valid input")
            
            return
        }
        
        //height in meters
        let height = (Double(feet!)*0.3048)+(Double(inch ?? 0)*0.0254)
        
        bmi = weight! / ( height * height )
        idealWeight = 22 * ( height * height )
        self.name = name!
        
//        print("bmi = \(bmi)")
    }
    
    func displayAlert(message:String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewController = segue.destination as! ResultViewController
        viewController.bmi = self.bmi
        viewController.idealWeight = self.idealWeight
        viewController.name = self.name
        
    }

}
