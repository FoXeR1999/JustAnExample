//
//  RepresentativeTableViewCell.swift
//  Lab_With_Alan
//
//  Created by Justin Herzog on 1/14/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    func updateCell(rep: Representative) {
        name.text = rep.name
        address.text = rep.address
        phoneNumber.text = rep.phoneNumber
    }

}
