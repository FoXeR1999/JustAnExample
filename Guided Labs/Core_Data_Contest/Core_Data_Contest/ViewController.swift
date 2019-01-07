//
//  ViewController.swift
//  Core_Data_Contest
//
//  Created by Justin Herzog on 1/7/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        let name = nameTextField.text
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("\(name!)", forKey: "name")
        
        do {
            try context.save()
        } catch {
            print("failed saving")
        }
        
        let request = NSFetchRequest < NSFetchRequestResult > (entityName: "Users")
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
                print("data group end")
            }
        } catch {
            print("failed to fetch data")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

