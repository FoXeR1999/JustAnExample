//
//  NarrowScopeSubjectTableViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 2/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import iosMath

class NarrowScopeSubjectTableViewController: UITableViewController {
    
    var latexCell = MTMathUILabel(frame: .zero)
    
    var secondarySubjects: [SecondarySubject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.4784, green: 0.4784, blue: 0.4784, alpha: 1.0) /* #7a7a7a */

    }    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondarySubjects.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondarySubjectCell", for: indexPath)
        
        cell.backgroundColor = UIColor(red: 0.4784, green: 0.4784, blue: 0.4784, alpha: 1.0) /* #7a7a7a */
//        cell.textLabel?.textColor = UIColor(red: 0.4588, green: 1, blue: 0.4588, alpha: 1.0) /* #75ff75 */
        
        cell.contentView.addSubview(latexCell)
        latexCell.latex = secondarySubjects[indexPath.row].name
        latexCell.textColor = UIColor(red: 0.4588, green: 1, blue: 0.4588, alpha: 1.0) /* #75ff75 */
        
//        cell.textLabel?.text = secondarySubjects[indexPath.row].name  // find out which cell was tapped and pull the array of subjects from the struct
        
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
        
        guard let formulaController = segue.destination as? FormulaViewController else { return }
        // For version 2 switch segue.destination to MainTabBarController and uncomment any comments
//        guard let tabBarSubcontrollers = tabBarController.viewControllers else { return } // 0: Formula, 1: Proof, 2: ExampleP, 3: RelatedFor, 4: Vocab, 5: Logic, 6: Trick
//        guard let formulaController = tabBarSubcontrollers[0] as? FormulaViewController else { return }
//        guard let proofController = tabBarSubcontrollers[1] as? ProofViewController else { return }
//        guard let exampleProblemController = tabBarSubcontrollers[2] as? ExampleProblemsTableViewController else { return }
//        guard let relatedFormulaController = tabBarSubcontrollers[3] as? RelatedFormulasTableViewController else { return }
//        guard let vocabularyController = tabBarSubcontrollers[4] as? VocabularyTableViewController else { return }
//        guard let logicController = tabBarSubcontrollers[5] as? LogicTableViewController else { return }
//        guard let trickController = tabBarSubcontrollers[6] as? TrickTableViewController else { return }
        
        if let indexPath = tableView.indexPathForSelectedRow,
            segue.identifier == "toFormulaController" {
            guard let unwrappedActualFromula = secondarySubjects[indexPath.row].formula.actualFormula as? String else { return }
            
            formulaController.formulaName = secondarySubjects[indexPath.row].formula.formulaName
            formulaController.actualFormula = unwrappedActualFromula
            formulaController.variableExplanation = secondarySubjects[indexPath.row].formula.variableExplanation
            formulaController.variableDescription = secondarySubjects[indexPath.row].formula.description
//
//            // Formula Controller
//            guard let unwrappedActualFormula = secondarySubjects[indexPath.row].formula.actualFormula as? String else { return }
//
//            formulaController.formulaName = secondarySubjects[indexPath.row].formula.formulaName
//            formulaController.actualFormula = unwrappedActualFormula
//            formulaController.variableExplanation = secondarySubjects[indexPath.row].formula.variableExplanation
//            formulaController.variableDescription = secondarySubjects[indexPath.row].formula.description
//
//            // Proof Controller
//            if secondarySubjects[indexPath.row].proof?.proofName != "" { // If it is something
//                guard let unwrappedProofName = secondarySubjects[indexPath.row].proof?.proofName else { return }
//                proofController.proofName = unwrappedProofName
//            }
//            if secondarySubjects[indexPath.row].proof?.proofImage != "" {
//                guard let unwrappedProofImage = secondarySubjects[indexPath.row].proof?.proofImage else { return }
//                proofController.proofImageName = unwrappedProofImage
//            }
//            if secondarySubjects[indexPath.row].proof?.proofDescription != "" {
//                guard let unwrappedProofDescription = secondarySubjects[indexPath.row].proof?.proofDescription else { return }
//                proofController.proofDescription = unwrappedProofDescription
//            }
//
//            // Example Problem Controller
//            if !secondarySubjects[indexPath.row].exampleProblems.isEmpty { // If it isn't empty
//                exampleProblemController.numberOfRows = secondarySubjects[indexPath.row].exampleProblems.count
//
//                for exampleProblem in secondarySubjects[indexPath.row].exampleProblems {
//                    guard let unwrappedExampleName = exampleProblem?.exampleProblemName as? String else { return }
//                    exampleProblemController.namesArray.append(unwrappedExampleName)
//                    guard let unwrappedExampleImage = exampleProblem?.exampleProblemImage else { return }
//                    exampleProblemController.imageArray.append(unwrappedExampleImage)
//                    guard let unwrappedStepsArray = exampleProblem?.steps else { return }
//                    exampleProblemController.stepsArray.append(unwrappedStepsArray)
//                }
//            }
//            // Related Formulas Controller
//            if !secondarySubjects[indexPath.row].relatedFormulas.isEmpty { // If related Formulas isn't empty
//                relatedFormulaController.numberOfRows = secondarySubjects[indexPath.row].relatedFormulas.count
//
//                for relatedFormula in secondarySubjects[indexPath.row].relatedFormulas {
//                    guard let unwrappedFormulaName = relatedFormula?.formulaName else { return }
//                    guard let unwrappedFormulaDescription = relatedFormula?.description else { return }
//                    relatedFormulaController.relatedFormulas.append(RelatedFormulas(formulaName: unwrappedFormulaName, description: unwrappedFormulaDescription))
//                }
//            }
//            // Vocabulary Controller
//            guard let vocabNumberOfRows = secondarySubjects[indexPath.row].vocabulary?.vocabulary.count else { return }
//            vocabularyController.numberOfRows = vocabNumberOfRows
//
//            guard let unwrappedVocabulary = secondarySubjects[indexPath.row].vocabulary?.vocabulary else { return }
//            vocabularyController.vocabulary = unwrappedVocabulary
//
//            // Logic Controller
//            guard let logicNumberOfRows = secondarySubjects[indexPath.row].logic?.logic.count else { return }
//            logicController.numberOfRows = logicNumberOfRows
//
//            guard let unwrappedLogic = secondarySubjects[indexPath.row].logic?.logic else { return }
//            logicController.logic = unwrappedLogic
//
//            // Trick Controller
//            if !secondarySubjects[indexPath.row].tricks.isEmpty { // If tricks isn't empty
//                trickController.numberOfRows = secondarySubjects[indexPath.row].tricks.count
//
//                for trick in secondarySubjects[indexPath.row].tricks {
//                    guard let unwrappedTrickName = trick?.trickName else { return }
//                    trickController.trickName.append(unwrappedTrickName)
//                    guard let unwrappedActualTrick = trick?.actualTrick else { return }
//                    trickController.actualTricks.append(unwrappedActualTrick)
//                }
//            }
        }
    }
}
