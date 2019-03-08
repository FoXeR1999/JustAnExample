//
//  NarrowScopeSubjectTableViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 2/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class NarrowScopeSubjectTableViewController: UITableViewController {
    
    var secondarySubjects: [SecondarySubject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondarySubjects.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondarySubjectCell", for: indexPath)
        
        cell.textLabel?.text = secondarySubjects[indexPath.row].name  // find out which cell was tapped and pull the array of subjects from the struct
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? MainTabBarViewController else { return }
        guard let tabBarSubcontrollers = tabBarController.viewControllers else { return } // 0: Formula, 1: Proof, 2: ExampleP, 3: RelatedFor, 4: Vocab, 5: Logic, 6: Trick
        guard let formulaController = tabBarSubcontrollers[0] as? FormulaViewController else { return }
        guard let proofController = tabBarSubcontrollers[1] as? ProofViewController else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "toTabBarController" {
            
            // Formula Controller
            guard let unwrappedActualFormula = secondarySubjects[indexPath.row].formula.actualFormula as? String else { return }
            
            formulaController.formulaName = secondarySubjects[indexPath.row].formula.formulaName
            formulaController.actualFormula = unwrappedActualFormula
            formulaController.variableExplanation = secondarySubjects[indexPath.row].formula.variableExplanation
            formulaController.variableDescription = secondarySubjects[indexPath.row].formula.description
            
            // Proof Controller
            if secondarySubjects[indexPath.row].proof?.proofName != "" {
                guard let unwrappedProofName = secondarySubjects[indexPath.row].proof?.proofName else { return }
                proofController.proofName = unwrappedProofName
            }
            if secondarySubjects[indexPath.row].proof?.proofImage != "" {
                guard let unwrappedProofImage = secondarySubjects[indexPath.row].proof?.proofImage else { return }
                proofController.proofImageName = unwrappedProofImage
            }
            if secondarySubjects[indexPath.row].proof?.proofDescription != "" {
                guard let unwrappedProofDescription = secondarySubjects[indexPath.row].proof?.proofDescription else { return }
                proofController.proofDescription = unwrappedProofDescription
            }
        }
    }
}
