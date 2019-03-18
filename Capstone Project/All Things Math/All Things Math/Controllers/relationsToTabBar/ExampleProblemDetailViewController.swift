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
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var latexExampleProblemName = MTMathUILabel(frame: .zero)
    var latexSteps = MTMathUILabel(frame: .zero)
    
    var exampleProblemName: String = ""
    var exampleProblemImageIdentifier: String = ""
    var steps: [Any] = []
    var stepString: String = ""
    
    @IBOutlet weak var exampleProblemNameLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var exampleProblemImage: UIImageView!
    
    @IBAction func showStepsButtonTapped(_ sender: Any) {
        if stepString.contains("displaystyle") {
            scrollView.addSubview(latexSteps)
            stepsLabel.isHidden = true
            latexSteps.latex = stepString
            
            latexSteps.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: latexSteps, attribute: .top, relatedBy: .equal, toItem: exampleProblemImage, attribute: .top, multiplier: 1, constant: 32),
                NSLayoutConstraint(item: latexSteps, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexSteps, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8)
                ])
            if latexSteps.isHidden == true {
                latexSteps.isHidden = false
            } else if latexSteps.isHidden == false {
                latexSteps.isHidden = true
            }
        } else if !stepString.contains("displaystyle") {
            latexSteps.isHidden = true
            if stepsLabel.isHidden == true {
                stepsLabel.isHidden = false
            } else if stepsLabel.isHidden == false {
                stepsLabel.isHidden = true
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(latexExampleProblemName)
        latexExampleProblemName.isHidden = true
        exampleProblemNameLabel.isHidden = false
        scrollView.addSubview(latexSteps)
        latexSteps.isHidden = true
        stepsLabel.isHidden = false
        
        if exampleProblemName.contains("displaystyle") {
            
            exampleProblemNameLabel.isHidden = true
            latexExampleProblemName.isHidden = false
            latexExampleProblemName.latex = exampleProblemName
            
            latexExampleProblemName.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                // NSLayoutConstraint(item: latexExampleProblemName, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexExampleProblemName, attribute: .right, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .right, multiplier: 1, constant: 8),
                NSLayoutConstraint(item: latexExampleProblemName, attribute: .left, relatedBy: .equal, toItem: scrollView.safeAreaLayoutGuide, attribute: .left, multiplier: 1, constant: 8)
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
        stepsLabel.text = stepString
        
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
