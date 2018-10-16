//
//  SecondViewController.swift
//  OrderOfEvents
//
//  Created by Justin Herzog on 10/16/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var eventNumber: Int = 1
    
    override func viewDidDisappear(_ animated: Bool) {
        if let existingText = label.text {
            label.text = "\(existingText) \n Event number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let existingText = label.text {
            label.text = "\(existingText) \n Event number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let existingText = label.text {
            label.text = "\(existingText) \n Event number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let existingText = label.text {
            label.text = "\(existingText) \n Event number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let existingText = label.text {
            label.text = "\(existingText) \n Event number \(eventNumber) was viewDidLoad"
            eventNumber += 1
        }
        // Do any additional setup after loading the view.
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
