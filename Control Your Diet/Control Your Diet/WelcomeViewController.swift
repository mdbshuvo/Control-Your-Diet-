//
//  ViewController.swift
//  Control Your Diet
//
//  Created by Badiuzzaman Shuvo on 27/10/19.
//  Copyright © 2019 Badiuzzaman Shuvo. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        image.layer.borderWidth=1.0
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.size.height/2
        image.clipsToBounds = true
    }


}

