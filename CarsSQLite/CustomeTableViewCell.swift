//
//  CustomeTableViewCell.swift
//  CarsSQLite
//
//  Created by AlexanderKogut on 8/14/17.
// alexander.kogyt@gmail.com
//  Copyright © 2017 AlexanderKogut. All rights reserved.
//

import UIKit

class CustomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var car: UILabel!
    @IBOutlet weak var model: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
