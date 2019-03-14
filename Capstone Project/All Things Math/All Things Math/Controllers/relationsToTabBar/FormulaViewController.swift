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
    
    var latexFormulaName = MTMathUILabel(frame: .zero)
    var latexActualFormula = MTMathUILabel(frame: .zero)
    var latexVariableExplanation = MTMathUILabel(frame: .zero)
    
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
        scrollView.addSubview(latexFormulaName)
        scrollView.addSubview(latexActualFormula)
        scrollView.addSubview(latexVariableExplanation)
        latexVariableExplanation.isHidden = true
        latexVariableExplanation.textAlignment = .center
        variableExplanationLabel.isHidden = false
        latexActualFormula.isHidden = true
        latexActualFormula.textAlignment = .center
        actualFormulaLabel.isHidden = false
        latexFormulaName.isHidden = true
        latexFormulaName.textAlignment = .center
        formulaNameLabel.isHidden = false
        
        if formulaName.contains("displaystyle") {
            latexFormulaName.isHidden = false
            formulaNameLabel.isHidden = true
            latexFormulaName.latex = formulaName
            latexFormulaName.fontSize = 30
            
            latexFormulaName.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                // NSLayoutConstraint(item: latexFormulaName, attribute: .top, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 16),
                NSLayoutConstraint(item: latexFormulaName, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexFormulaName, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
                ])
        } else {
            formulaNameLabel.text = formulaName
            formulaNameLabel.isHidden = false
        }
        
        if actualFormula.contains("displaystyle") {
            latexActualFormula.isHidden = false
            actualFormulaLabel.isHidden = true
            latexActualFormula.latex = actualFormula
            
            latexActualFormula.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexActualFormula, attribute: .top, relatedBy: .equal, toItem: latexFormulaName, attribute: .top, multiplier: 1, constant: 32),
                NSLayoutConstraint(item: latexActualFormula, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexActualFormula, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
                ])
        } else {
            actualFormulaLabel.text = actualFormula
            formulaNameLabel.isHidden = false
        }
        
        if variableExplanation.contains("displaystyle") {
            latexVariableExplanation.isHidden = false
            variableExplanationLabel.isHidden = true
            latexVariableExplanation.latex = variableExplanation
            
            latexVariableExplanation.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexVariableExplanation, attribute: .top, relatedBy: .equal, toItem: latexActualFormula, attribute: .top, multiplier: 1, constant: 32),
                NSLayoutConstraint(item: latexVariableExplanation, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexVariableExplanation, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
                ])
        } else {
            variableExplanationLabel.text = variableExplanation
            variableExplanationLabel.isHidden = false
        }
        descriptionLabel.text = variableDescription
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
