//
//  BreakfastTableViewCell.swift
//  Control Your Diet
//
//  Created by Badiuzzaman Shuvo on 1/11/19.
//  Copyright © 2019 Badiuzzaman Shuvo. All rights reserved.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {

    @IBOutlet weak var foodLabel: UILabel!
    
    func load(data:String) {
        foodLabel.text = data
    }
    
}

class HeadersTableViewCell: UITableViewCell {
    @IBOutlet weak var headerLabel: UILabel!
    
    func load(data:String) {
        headerLabel.text = data
    }
}
