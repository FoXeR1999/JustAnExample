//
//  TrickDetailViewController.swift
//  All Things Math
//
//  Created by Justin Herzog on 3/11/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class TrickDetailViewController: UIViewController {

    var trickName: String = ""
    var actualTrick: String = ""
    
    @IBOutlet weak var trickNameLabel: UILabel!
    @IBOutlet weak var actualTrickLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trickNameLabel.text = trickName
        actualTrickLabel.text = actualTrick
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
