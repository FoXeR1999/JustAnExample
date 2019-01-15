//
//  RepresentativeViewController.swift
//  Lab_With_Alan
//
//  Created by Justin Herzog on 1/14/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class RepresentativeViewController: UIViewController {
    
    @IBOutlet weak var currentRepresentativeTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateView()
    }
    
    var representative: Representative? {
        return RepresentativeController.sharedController.representatives.first
    }
    
    func updateView() {
        if let rep = representative {
            nameLabel.text = rep.name
            addressLabel.text = rep.address
            phoneNumberLabel.text = rep.phoneNumber
        } else {
            nameLabel.text = "Search for a Rep!"
            addressLabel.text = "Search for a Rep!"
            phoneNumberLabel.text = "Search for a Rep!"
        }
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
