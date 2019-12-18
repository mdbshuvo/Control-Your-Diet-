//
//  FoodDetailsViewController.swift
//  Control Your Diet
//
//  Created by Badiuzzaman Shuvo on 12/11/19.
//  Copyright © 2019 Badiuzzaman Shuvo. All rights reserved.
//

import UIKit

class FoodDetailsViewController: UIViewController {

    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var testText: UITextView!
    var selectedFood = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let ingr = getIngr()
        foodLabel.text = ingr
        
        let ingrUrl = ingr?.replacingOccurrences(of: " ", with: "%20")
        guard let url = URL(string: "https://api.edamam.com/api/nutrition-data?app_id=72eb720e&app_key=b906712fc34381949520b344321d6bf3&ingr=" + ingrUrl!) else { print("Problem in url"); return; }
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.loadUI(data: data!)
                }
//                print(response)
            }
        }
        task.resume()
    }
    
    func loadUI(data: Data) {
        do{
            let jsonRes = try JSONSerialization.jsonObject(with: data, options: [])
            print(jsonRes)
            let jsonObj = jsonRes as! [String:Any]
            
            var resultStr:String
            let weight = jsonObj["totalWeight"] as! Double
            let calories = jsonObj["calories"] as! Double
            
            resultStr = "Total weight : \(weight) gm\n"
            resultStr += "Total calories : " + String(format: "%.2lf", calories) + " kcal\n\n\n"
            
            let nutrients = jsonObj["totalNutrients"] as! [String:Any]
            
           
            let nutrientKeys = nutrients.keys
            for key in nutrientKeys {
                let node = nutrients[key] as! [String:Any]
                
                let nodeName = node["label"] as! String
                let nodeqty = node["quantity"] as! Double
                let nodeUnit = node["unit"] as! String
                
                let line = nodeName + " : " + String(format: "%.2lf", nodeqty) + " " + nodeUnit + "\n"
                resultStr += line
            }
            
            testText.text = resultStr
            
        }catch let parsingError {
            print("Error occured : " + parsingError.localizedDescription)
        }
    }
    
    func getIngr() -> String! {
        if selectedFood == "Rice" {
            return "1 cup Rice"
        }
        else if selectedFood == "Egg" {
            return "1 piece Egg"
        }
        else if selectedFood == "Milk" {
            return "1 glass Milk"
        }
        else if selectedFood == "Potato" {
            return "100 gram Potato"
        }
        else if selectedFood == "Banana" {
            return "1 piece Banana"
        }
        else if selectedFood == "Fish" {
            return "100 gram Fish"
        }
        else if selectedFood == "Meat" {
            return "100 gram Meat"
        }
        else if selectedFood == "Vegetables" {
            return "100 gram Vegetables"
        }
        else if selectedFood == "Apple" {
            return "1 piece Apple"
        }
        else if selectedFood == "Pea Water" {
            return "1 cup Pea Water"
        }
        else if selectedFood == "Orange" {
            return "1 piece Orange"
        }
        else if selectedFood == "Lemon" {
            return "1 piece Lemon"
        }
        else if selectedFood == "Cucumber" {
            return "100 gram Cucumber"
        }
        else if selectedFood == "Green Tea" {
            return "1 cup Green Tea"
        }
        else if selectedFood == "Flour Bread" {
            return "1 piece Flour Bread"
        }
        
        return "1 cup rice"
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
