//
//  GameViewController.swift
//  ScoreKeeper
//
//  Created by Justin Herzog on 11/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var name: String?
    
    @IBOutlet weak var gameNameTextField: UITextField!
    
    @IBAction func saveGameButton(_ sender: Any) {
        
        name = gameNameTextField.text
        
        performSegue(withIdentifier: "unwindToGameTableViewController", sender: self)
        
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
