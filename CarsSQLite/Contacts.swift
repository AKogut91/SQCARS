//
//  Contacts.swift
//  CarsSQLite
//
//  Created by AlexanderKogut on 8/14/17.
//  Copyright © 2017 AlexanderKogut. All rights reserved.
//

import Foundation

class Contacts {
    
    var id = Int64()
    var name: String = ""
    var email: String = ""
    var carBrand: String = ""
    var modelCar: String = ""
    
    init(id: Int64, name:String, email: String, carBrand: String, modelCar: String) {
        
        self.id = id
        self.name = name
        self.email = email
        self.carBrand = carBrand
        self.modelCar = modelCar
        
    }
    
}
