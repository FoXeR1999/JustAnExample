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
        
        guard let homeworkSetupViewController = segue.source as? HomeworkSetupViewController, let homework = homeworkSetupViewController.homework else { return }
        
        homeworks.append(homework)
        
        tableView.reloadData()
        
    }
    
    /////////////////////////////
    // MARK: Delete Homeworks //
    ///////////////////////////
    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            homeworks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        Homework.saveToFile(homeworks: homeworks)
    }
    
    ////////////////////////
    // MARK: viewDidLoad //
    //////////////////////
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let savedHomeworks = Homework.loadFromFile() {
            homeworks = savedHomeworks
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableTableViewCell else { return UITableViewCell() }
        
        let className = homeworks[indexPath.row].className
        let homeworkName = homeworks[indexPath.row].homework
        let dueDateName = homeworks[indexPath.row].dueDate
        
        cell.classLabel.text = className
        cell.assignmentLabel.text = homeworkName
        cell.dueDate.text = dueDateName
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworks.count
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == PropertyKeys.editHomeworkSegueIdentifier {
            let indexPath = tableView.indexPathForSelectedRow!
            let homework = homeworks[indexPath.row]
            
            guard let homeworkSetupViewController = UIViewController() as? HomeworkSetupViewController else { return }
            homeworkSetupViewController.homework?.className = homework.className
            homeworkSetupViewController.homework?.homework = homework.homework
            homeworkSetupViewController.homework?.dueDate = homework.dueDate
        }
    }
    
}
