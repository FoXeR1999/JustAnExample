//
//  FormulaViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class FormulaViewController: UIViewController {

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
        
        formulaNameLabel.text = formulaName
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
