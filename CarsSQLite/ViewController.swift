//
//  ViewController.swift
//  CarsSQLite
//
//  Created by AlexanderKogut on 8/14/17.
//  Copyright © 2017 AlexanderKogut. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    @IBOutlet weak var carTable: UITableView!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var carBrand: UITextField!
    @IBOutlet weak var mobdelCar: UITextField!
    
    
    var contacts = [Contacts]()
    var selectedContacts: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carTable.dataSource = self
        carTable.delegate = self
       
    }


    @IBAction func login(_ sender: Any) {
        
        let name = self.name.text
        let email = self.email.text
        let carBrand = self.carBrand.text
        let modelCar = self.mobdelCar.text
        
        let contact = Contacts.init(id: 0, name: name!, email: email!, carBrand: carBrand!, modelCar: modelCar!)
        
        contacts.append(contact)
        
        carTable.reloadData()
                
        print("Login")
        
    }
    

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = contacts[indexPath.row].modelCar
        
        selectedContacts = indexPath.row
        
        return cell
        
    }
    
    
}

