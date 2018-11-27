//
//  MainTableViewController.swift
//  GuidedLabList
//
//  Created by Justin Herzog on 11/26/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    struct PropertyKeys {
        static let homeworkCellIdentifier = "MainTableViewCell"
        static let addHomeworkSegueIdentifier = "addHomworkSegue"
        static let editHomeworkSegueIdentifier = "editHomeworkSegue"
    }
    
    var homeworks: [Homework] = []
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
        guard let homeworkSetupViewController = segue.destination as? HomeworkSetupViewController, let homework = homeworkSetupViewController.homework else { return }
      
        
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let HomeworkSetupViewController = segue.destination as? HomeworkSetupViewController else { return }
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == PropertyKeys.editHomeworkSegueIdentifier {
            
            HomeworkSetupViewController.homework = homeworks[indexPath.row]
        }
    }

}
