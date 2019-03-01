//
//  ViewController.swift
//  TobeyFirbaseQuiz
//
//  Created by Justin Herzog on 2/26/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Person {
        let name: String
        let age: Int
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

