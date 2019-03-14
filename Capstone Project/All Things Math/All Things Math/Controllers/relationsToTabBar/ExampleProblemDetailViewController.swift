//
//  ExampleProblemDetailViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import iosMath

class ExampleProblemDetailViewController: UIViewController {
    
    var latexExampleProblemName = MTMathUILabel(frame: .zero)
    
    var exampleProblemName: String = ""
    var exampleProblemImageIdentifier: String = ""
    var steps: [Any] = []
    var stepString: Any = ""
    
    @IBOutlet weak var exampleProblemNameLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var exampleProblemImage: UIImageView!
    
    @IBAction func showStepsButtonTapped(_ sender: Any) {
            if stepsLabel.isHidden == true {
                stepsLabel.isHidden = false
            } else if stepsLabel.isHidden == false {
                stepsLabel.isHidden = true
            }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(latexExampleProblemName)
        latexExampleProblemName.isHidden = true
        exampleProblemNameLabel.isHidden = false
        
        if exampleProblemName.contains("displaystyle") {
            
            exampleProblemNameLabel.isHidden = true
            latexExampleProblemName.isHidden = false
            latexExampleProblemName.latex = exampleProblemName
            
            latexExampleProblemName.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexExampleProblemName, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexExampleProblemName, attribute: .right, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexExampleProblemName, attribute: .left, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8)
                ])
        }
        
        if exampleProblemImageIdentifier != "" {
            exampleProblemImage.image = UIImage(named: exampleProblemImageIdentifier)
            exampleProblemImage.frame = CGRect(x: 0, y: 0, width: 359, height: 359)
        } else {
            exampleProblemImage.isHidden = true
            exampleProblemImage.frame = CGRect(x: 0, y: 0, width: 359, height: 0)
            
        }
        stepsLabel.isHidden = true
        
        exampleProblemNameLabel.text = exampleProblemName
        exampleProblemImage.image = UIImage(named: exampleProblemImageIdentifier)
        
        for step in steps {
            stepString = "\(stepString) \(step)\n"
        }
        stepsLabel.text = stepString as? String  // I need to find out how to do this with the amount of steps in the array without a giant if statement
        
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
