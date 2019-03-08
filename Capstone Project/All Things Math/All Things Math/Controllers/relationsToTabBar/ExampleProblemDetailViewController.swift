//
//  ExampleProblemDetailViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class ExampleProblemDetailViewController: UIViewController {
    
    var exampleProblemName: String = ""
    var exampleProblemImageIdentifier: String = ""
    var steps: [Any] = []
    
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
        
        stepsLabel.isHidden = true
        
        exampleProblemNameLabel.text = exampleProblemName
        exampleProblemImage.image = UIImage(named: exampleProblemImageIdentifier)
        print(steps.count)
        stepsLabel.text = ("\(steps[0])\n\(steps[1])\n\(steps[2])")
        
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
