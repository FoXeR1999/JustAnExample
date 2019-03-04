//
//  ExampleProblemDetailViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/4/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class ExampleProblemDetailViewController: UIViewController {

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
        // Do any additional setup after loading the view.
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
