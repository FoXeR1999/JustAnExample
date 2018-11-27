//
//  HomeworkSetupViewController.swift
//  GuidedLabList
//
//  Created by Justin Herzog on 11/26/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class HomeworkSetupViewController: UIViewController {
    
    struct PropertyKeys {
        static let unwindToListIdentifier = "unwindToMainTableView"
    }
    
    var homework: Homework?
    
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var homeworkTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    
    @IBAction func cancelTapped(_ sender: Any) {
        
        homework = nil
        
        performSegue(withIdentifier: PropertyKeys.unwindToListIdentifier, sender: self)
    }
    
    @IBAction func saveTapped(_ sender: Any) {
        
        if let course = classTextField.text, let assignment = homeworkTextField.text, let dueDate = dueDateTextField.text {
            
            homework = Homework(className: course, homework: assignment, dueDate: dueDate)
            
            performSegue(withIdentifier: PropertyKeys.unwindToListIdentifier, sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
