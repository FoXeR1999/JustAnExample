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
        latexFormulaName.isHidden = true
        latexFormulaName.textAlignment = .center
        formulaNameLabel.isHidden = false
        
        if formulaName.contains("displaystyle") {
            latexFormulaName.isHidden = false
            formulaNameLabel.isHidden = true
            latexFormulaName.latex = formulaName
            
            latexFormulaName.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexFormulaName, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexFormulaName, attribute: .left, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexFormulaName, attribute: .right, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
                ])
        } else {
            formulaNameLabel.text = formulaName
            formulaNameLabel.isHidden = false
        }
        
        actualFormulaLabel.text = actualFormula
        variableExplanationLabel.text = variableExplanation
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
