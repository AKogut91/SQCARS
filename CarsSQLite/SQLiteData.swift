//
//  SQLiteData.swift
//  CarsSQLite
//
//  Created by AlexanderKogut on 8/14/17.
//  Copyright © 2017 AlexanderKogut. All rights reserved.
//

import Foundation

import SQLite

class ContactsDB {
    
    static let instance = ContactsDB()
    
    private let db: Connection?
    
    let contacts = Table("contacts")
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    let carBrand = Expression<String>("carBrand")
    let carModel = Expression<String>("carModel")
    
    private init () {
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        
        do {
            
            db = try Connection("\(path)/Stephencelis.sqlite3")
            
        } catch {
            
            db = nil
            print(error)
            
        }
    
    
    
    }
    
    
    
    
}
