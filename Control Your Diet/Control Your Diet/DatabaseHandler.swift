//
//  DatabaseHandler.swift
//  Control Your Diet
//
//  Created by Badiuzzaman Shuvo on 9/11/19.
//  Copyright © 2019 Badiuzzaman Shuvo. All rights reserved.
//

import Foundation
import SQLite3

class DatabaseHandler {
    static var db : OpaquePointer?
    
    static func initDatabase(){
        if db == nil {
            let dbPathUrl = Bundle.main.resourceURL?.appendingPathComponent("diet.sqlite")
            if sqlite3_open(dbPathUrl?.path, &db) != SQLITE_OK {
                print("Error : Opening database !!")
            }
        }
    }
    
    static func getFoods( category: Int, type: Int) -> [String] {
        
        var foods: [String] = []
        
        let statement = "SELECT Name FROM Foods, Schedule WHERE Foods.ID = Schedule.Food_ID AND Category = ? AND Type = ?;"
        
        var statementPointer : OpaquePointer?
        if sqlite3_prepare_v2(db, statement, -1, &statementPointer, nil) != SQLITE_OK {
            print("Error : compilining statement !!")
        }
        
        if sqlite3_bind_int(statementPointer, 1, Int32(category)) != SQLITE_OK {
            print("Error : assigning category !!")
        }
        
        if sqlite3_bind_int(statementPointer, 2, Int32(type)) != SQLITE_OK {
            print("Error : assigning type !!")
        }
        
        while sqlite3_step(statementPointer) == SQLITE_ROW {
            let temp = sqlite3_column_text(statementPointer, 0)
            let foodName = String(cString: temp!)
            
            foods.append(foodName)
        }
        
        return foods
    }
    
    static func getExercizes( category: Int, type: Int) -> [String] {
        
        var exercizes: [String] = []
        
        let statement = "SELECT Duration FROM Exercize WHERE Category = ? AND Type = ?;"
        
        var statementPointer : OpaquePointer?
        if sqlite3_prepare_v2(db, statement, -1, &statementPointer, nil) != SQLITE_OK {
            print("Error : compilining statement !!")
        }
        
        if sqlite3_bind_int(statementPointer, 1, Int32(category)) != SQLITE_OK {
            print("Error : assigning category !!")
        }
        
        if sqlite3_bind_int(statementPointer, 2, Int32(type)) != SQLITE_OK {
            print("Error : assigning type !!")
        }
        
        while sqlite3_step(statementPointer) == SQLITE_ROW {
            let temp = sqlite3_column_text(statementPointer, 0)
            let exercizeName = String(cString: temp!)
            
            exercizes.append(exercizeName)
        }
        
        return exercizes
    }
}
