//
//  FoodViewController.swift
//  Control Your Diet
//
//  Created by Badiuzzaman Shuvo on 1/11/19.
//  Copyright © 2019 Badiuzzaman Shuvo. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var breakfastTable: UITableView!
    var category = 0
    var selectedFood = ""
    var list = [String]()
    var headersMarker = [Int]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if headersMarker.contains(indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeadersTableViewCell", for: indexPath) as! HeadersTableViewCell
            
            cell.load(data: list[indexPath.row])
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodsTableViewCell", for: indexPath) as! FoodsTableViewCell
            cell.load(data: list[indexPath.row])
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(list[indexPath.row] + " is selected")
        if !headersMarker.contains(indexPath.row) {
            selectedFood = list[indexPath.row]
            self.performSegue(withIdentifier: "foodDetailsSegue", sender: self)
        }
        
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DatabaseHandler.initDatabase()
        
        list.append("Breakfast")
        headersMarker.append(list.count-1)
        let breakfast = DatabaseHandler.getFoods(category: category, type: 0)
        list.append(contentsOf: breakfast)
        
        list.append("Lunch")
        headersMarker.append(list.count-1)
        let lunch = DatabaseHandler.getFoods(category: category, type: 1)
        list.append(contentsOf: lunch)
        
        list.append("Dinner")
        headersMarker.append(list.count-1)
        let dinner = DatabaseHandler.getFoods(category: category, type: 2)
        list.append(contentsOf: dinner)
        
        tableView.tableFooterView = UIView()
        
    }
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let viewController = segue.destination as! FoodDetailsViewController
        viewController.selectedFood = self.selectedFood
        
    }

}
