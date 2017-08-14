//
//  SQLiteData.swift
//  CarsSQLite
//
//  Created by AlexanderKogut on 8/14/17.
// alexander.kogyt@gmail.com
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
        
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            
            db = try Connection("\(path)/Stephencelis.sqlite3")
            
            print(db)
            
            createTable()
            
        } catch {
            
            db = nil
            print(error)
            
        }

    }
    
    func createTable() {
        
        do {
            try db!.run(contacts.create(ifNotExists: true) { table in
                
                table.column(id, primaryKey: true)
                table.column(name)
                table.column(email)
                table.column(carBrand)
                table.column(carModel)
            
            })
            
            
            
        } catch {
            
            print("Unable to create table")
        }
        
    }
    
    
    func addContanct(cname: String, cemail: String, ccar: String,cmodel: String) -> Int64? {
        
        do {
           
            let insert = contacts.insert(name <- cname, email <- cemail, carBrand <- ccar, carModel <- cmodel)
            
            let id = try db!.run(insert)
            
            print(insert.asSQL())
            
            return id
        } catch {
            
            print("Insert failed")
            return -1
        }
        
    }
    
    
    func getContact() -> [Contacts] {
        
        var contacts = [Contacts]()
        
        do {
            
            for contact in try db!.prepare(self.contacts) {
                
                contacts.append(Contacts(
                    id:contact[id],
                    name: contact[name],
                    email: contact[email],
                    carBrand: contact[carBrand],
                    modelCar: contact[carModel]
                    ))
       
            
            }
        } catch {
            
            print("Selected Fail")
        }

        
        return contacts
    }
    
    
    func deletid(cid: Int64) -> Bool {
        
        do {
            
            let contact = contacts.filter(id == cid)
            try db!.run(contact.delete())
            return true
            
        } catch {
            
            print("Delet failed")
        }
        
        return false
    }
    
    
    
    
    
    
    
    
} // end class
