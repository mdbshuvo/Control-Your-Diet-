//
//  ExercizeViewController.swift
//  Control Your Diet
//
//  Created by Badiuzzaman Shuvo on 13/11/19.
//  Copyright © 2019 Badiuzzaman Shuvo. All rights reserved.
//

import UIKit

class ExercizeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var exercizes = [String]()
    var headersMarker = [Int]()
    @IBOutlet weak var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercizes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if headersMarker.contains(indexPath.row) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExHeadersTableViewCell", for: indexPath) as! HeadersTableViewCell
            
            cell.load(data: exercizes[indexPath.row])
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExercizeTableViewCell", for: indexPath) as! FoodsTableViewCell
            cell.load(data: exercizes[indexPath.row])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    var category = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        DatabaseHandler.initDatabase()
        
        exercizes.append("Walking")
        headersMarker.append(exercizes.count - 1)
        let walking = DatabaseHandler.getExercizes(category: category,type: 0)
        exercizes.append(contentsOf: walking)
        
        exercizes.append("Running")
        headersMarker.append(exercizes.count - 1)
        let running = DatabaseHandler.getExercizes(category: category,type: 1)
        exercizes.append(contentsOf: running)
        
        exercizes.append("Cycling")
        headersMarker.append(exercizes.count - 1)
        let cycling = DatabaseHandler.getExercizes(category: category,type: 2)
        exercizes.append(contentsOf: cycling)
        
        exercizes.append("Swimming")
        headersMarker.append(exercizes.count - 1)
        let swimming = DatabaseHandler.getExercizes(category: category,type: 3)
        exercizes.append(contentsOf: swimming)
        
        tableview.tableFooterView = UIView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
