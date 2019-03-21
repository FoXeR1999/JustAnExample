//
//  BroadScopeSubjectTableViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 2/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class BroadScopeSubjectTableViewController: UITableViewController {
    
    var searchTerms: [String] = []
    
    var subjectsStruct = Subjects()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.4784, green: 0.4784, blue: 0.4784, alpha: 1.0) /* #7a7a7a */
        
        
        subjectsStruct.setUpSubjects { (algebraArray, arithmeticArray, calculusArray, geometryArray, trigonometryArray, statsArray) in
            self.subjectsStruct.subjects["Algebra"] = algebraArray
            self.subjectsStruct.subjects["Arithmetic"] = arithmeticArray
            self.subjectsStruct.subjects["Calculus"] = calculusArray
            self.subjectsStruct.subjects["Geometry"] = geometryArray
            self.subjectsStruct.subjects["Trigonometry"] = trigonometryArray
            self.subjectsStruct.subjects["Statistics and Probability"] = statsArray
        }
        
        // SETUP SEARCH TERMS
        guard let algebraSecondarySubjects = subjectsStruct.subjects["Algebra"],
            let arithmeticSecondarySubjects = subjectsStruct.subjects["Arithmetic"],
            let calculusSecondarySubjects = subjectsStruct.subjects["Calculus"],
            let geometrySecondarySubjects = subjectsStruct.subjects["Geometry"],
            let trigonometrySecondarySubjects = subjectsStruct.subjects["Trigonometry"],
            let statsSecondarySubjects = subjectsStruct.subjects["Statistics and Probability"] else { return }
        for subject in algebraSecondarySubjects {
            searchTerms.append(subject.name)
        }
        for subject in arithmeticSecondarySubjects {
            searchTerms.append(subject.name)
        }
        for subject in calculusSecondarySubjects {
            searchTerms.append(subject.name)
        }
        for subject in geometrySecondarySubjects {
            searchTerms.append(subject.name)
        }
        for subject in trigonometrySecondarySubjects {
            searchTerms.append(subject.name)
        }
        for subject in statsSecondarySubjects {
            searchTerms.append(subject.name)
        }
        subjectsStruct.subjects.removeValue(forKey: "Algebra")
        subjectsStruct.subjects.removeValue(forKey: "Arithmetic")
        subjectsStruct.subjects.removeValue(forKey: "Geometry")
        subjectsStruct.subjects.removeValue(forKey: "Trigonometry")
        subjectsStruct.subjects.removeValue(forKey: "Statistics and Probability")
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectsStruct.subjects.keys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectCell", for: indexPath)
        
        cell.backgroundColor = UIColor(red: 0.4784, green: 0.4784, blue: 0.4784, alpha: 1.0) /* #7a7a7a */
        cell.textLabel?.textColor = UIColor(red: 0.4588, green: 1, blue: 0.4588, alpha: 1.0) /* #75ff75 */
        
        var sortedSubjectDictionary = (subjectsStruct.subjects.keys).sorted() // Alphabatized subjects
        
        cell.textLabel?.text = sortedSubjectDictionary[indexPath.row]
        
        return cell
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let narrowScopeTVC = segue.destination as? NarrowScopeSubjectTableViewController else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "toNarrowScopeTableView" {
            
            let sortedSubjectDictionary = (subjectsStruct.subjects.keys).sorted()
            
            let cellTappedName = sortedSubjectDictionary[indexPath.row]
            
            guard let unwrappedSecondarySubjects = subjectsStruct.subjects[cellTappedName] else {
                print("KUSO YARO")
                return
            }
            narrowScopeTVC.secondarySubjects = unwrappedSecondarySubjects
        }
    }
}
