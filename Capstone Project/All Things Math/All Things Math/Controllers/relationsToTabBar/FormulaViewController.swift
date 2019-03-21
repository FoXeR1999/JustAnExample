//
//  FormulaViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import iosMath

class FormulaViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewInScrollView: UIView!
    
    var latexFormulaName = MTMathUILabel(frame: .zero)
    var latexActualFormula = MTMathUILabel(frame: .zero)
    var latexVariableExplanation = MTMathUILabel(frame: .zero)
    var latexDescription = MTMathUILabel(frame: .zero)
    
    var formulaName: String = ""
    var actualFormula: String = ""
    var variableExplanation: String = ""
    var variableDescription: String = ""
    
    @IBOutlet weak var formulaNameLabel: UILabel!
    @IBOutlet weak var actualFormulaLabel: UILabel!
    @IBOutlet weak var variableExplanationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.4784, green: 0.4784, blue: 0.4784, alpha: 1.0) /* #7a7a7a */
        scrollView.backgroundColor = UIColor(red: 0.4784, green: 0.4784, blue: 0.4784, alpha: 1.0)
        viewInScrollView.backgroundColor = UIColor(red: 0.4784, green: 0.4784, blue: 0.4784, alpha: 1.0)
        
        variableExplanationLabel.isHidden = true
        descriptionLabel.isHidden = true
        latexVariableExplanation.isHidden = true
        latexDescription.isHidden = true
        actualFormulaLabel.isHidden = true
        formulaNameLabel.isHidden = true
        
   
        scrollView.addSubview(latexFormulaName)
        scrollView.addSubview(latexActualFormula)
//        scrollView.addSubview(latexDescription)
//        scrollView.addSubview(latexVariableExplanation)
//        latexDescription.isHidden = true
//        latexDescription.textAlignment = .center
//        descriptionLabel.isHidden = false
//        latexVariableExplanation.isHidden = true
//        latexVariableExplanation.textAlignment = .center
//        variableExplanationLabel.isHidden = false
        latexActualFormula.isHidden = false
        latexActualFormula.textAlignment = .left
//        actualFormulaLabel.isHidden = false
        latexFormulaName.isHidden = false
        latexFormulaName.textAlignment = .center
//        formulaNameLabel.isHidden = false
        
        if formulaName.contains("displaystyle") {
//            latexFormulaName.isHidden = false
//            formulaNameLabel.isHidden = true
            latexFormulaName.latex = formulaName
            latexFormulaName.fontSize = 24
            latexFormulaName.textColor = UIColor(red: 0.4588, green: 1, blue: 0.4588, alpha: 1.0) /* #75ff75 */
            
            latexFormulaName.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                // NSLayoutConstraint(item: latexFormulaName, attribute: .top, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 16),
                NSLayoutConstraint(item: latexFormulaName, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 4),
                NSLayoutConstraint(item: latexFormulaName, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 4)
                ])
        } else {
            formulaNameLabel.text = formulaName
            formulaNameLabel.isHidden = false
        }
        
        if actualFormula.contains("displaystyle") {
//            latexActualFormula.isHidden = false
//            actualFormulaLabel.isHidden = true
            latexActualFormula.latex = actualFormula
            latexActualFormula.fontSize = 20
            latexActualFormula.textColor = UIColor(red: 0.4588, green: 1, blue: 0.4588, alpha: 1.0) /* #75ff75 */
            
            latexActualFormula.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexActualFormula, attribute: .top, relatedBy: .equal, toItem: latexFormulaName, attribute: .top, multiplier: 1, constant: 64),
                NSLayoutConstraint(item: latexActualFormula, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 4),
                NSLayoutConstraint(item: latexActualFormula, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 4)
                ])
        }
//        else {
//            actualFormulaLabel.text = actualFormula
//            formulaNameLabel.isHidden = false
//        }
        
//        if variableExplanation.contains("displaystyle") {
//            latexVariableExplanation.isHidden = false
//            variableExplanationLabel.isHidden = true
//            latexVariableExplanation.latex = variableExplanation
//
//            latexVariableExplanation.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                NSLayoutConstraint(item: latexVariableExplanation, attribute: .top, relatedBy: .equal, toItem: latexActualFormula, attribute: .top, multiplier: 1, constant: 32),
//                NSLayoutConstraint(item: latexVariableExplanation, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
//                NSLayoutConstraint(item: latexVariableExplanation, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
//                ])
//        } else {
//            variableExplanationLabel.text = variableExplanation
//            variableExplanationLabel.isHidden = false
//        }
//
//        if variableDescription.contains("displaystyle") {
//            latexDescription.isHidden = false
//            descriptionLabel.isHidden = true
//            latexDescription.latex = variableDescription
//
//            latexDescription.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                NSLayoutConstraint(item: latexDescription, attribute: .top, relatedBy: .equal, toItem: latexVariableExplanation, attribute: .top, multiplier: 1, constant: 32),
//                NSLayoutConstraint(item: latexDescription, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
//                NSLayoutConstraint(item: latexDescription, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
//                ])
//        } else {
//            descriptionLabel.text = variableDescription
//            descriptionLabel.isHidden = false
//        }
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
