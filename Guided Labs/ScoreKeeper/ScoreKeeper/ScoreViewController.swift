//
//  ScoreViewController.swift
//  ScoreKeeper
//
//  Created by Justin Herzog on 11/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    var playerName: String?
    
    @IBOutlet weak var playerTextField: UITextField!
    
    @IBAction func playerSaveButton(_ sender: Any) {
        
        playerName = playerTextField.text
        
        performSegue(withIdentifier: "unwindToScoresTableView", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
