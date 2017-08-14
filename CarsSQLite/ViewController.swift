//
//  ViewController.swift
//  CarsSQLite
//
//  Created by AlexanderKogut on 8/14/17.
// alexander.kogyt@gmail.com
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
        
        contacts = ContactsDB.instance.getContact()
       
    }

    @IBAction func login(_ sender: Any) {
        
        let name = self.name.text ?? ""
        let email = self.email.text ?? ""
        let carBrand = self.carBrand.text ?? ""
        let modelCar = self.mobdelCar.text ?? ""
        
    
        if let id = ContactsDB.instance.addContanct(cname: name, cemail: email, ccar: carBrand, cmodel: modelCar) {
            
        let contact = Contacts.init(id: id, name: name, email: email, carBrand: carBrand, modelCar: modelCar)
            
            contacts.append(contact)
            
            carTable.insertRows(at: [IndexPath(row: contacts.count-1, section: 0)], with: .fade)
            
        }
    
        print("Login")
        
    }
    

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeTableViewCell
        
        let contactIndex = contacts[indexPath.row]
        
        cell.email.text = contactIndex.email
        cell.name.text = contactIndex.name
        cell.car.text = contactIndex.carBrand
        cell.model.text = contactIndex.modelCar
        
    
        selectedContacts = indexPath.row
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if selectedContacts != nil {
            ContactsDB.instance.deletid(cid: contacts[selectedContacts!].id)
            contacts.remove(at: selectedContacts!)
            
             carTable.deleteRows(at: [IndexPath(row: contacts.count-1, section: 0)], with: .fade)
            
        }
    }
    
    
}

