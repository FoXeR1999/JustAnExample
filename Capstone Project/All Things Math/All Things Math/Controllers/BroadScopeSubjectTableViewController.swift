//
//  BroadScopeSubjectTableViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 2/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class BroadScopeSubjectTableViewController: UITableViewController {
    
    let subjectsStruct = Subjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectsStruct.setUpSubjects()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return subjectsStruct.subjects.keys.count
//        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath)
        
        let sortedSubjectDictionary = (subjectsStruct.subjects.keys).sorted() // Alphabatized subjects
        
        cell.textLabel?.text = sortedSubjectDictionary[indexPath.row]
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let narrowScopeTableView = segue.destination as? NarrowScopeSubjectTableViewController else { return }
//
//        let sortedSubjectDictionary = (subjectsStruct.subjects.keys).sorted()
//
//        if let indexPath = tableView.indexPathForSelectedRow,
//            segue.identifier == "toNarrowScopeTableView" {
//
//            guard let unwrappedSubject = subjectsStruct.subjects[sortedSubjectDictionary[indexPath.row]] else { return }
//
//            narrowScopeTableView.secondarySubjects = unwrappedSubject.sorted()
//
//        }
//
//    }
    
}
