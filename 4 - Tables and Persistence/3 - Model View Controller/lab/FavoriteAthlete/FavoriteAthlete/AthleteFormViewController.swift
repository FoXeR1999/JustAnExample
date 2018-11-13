//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Justin Herzog on 11/5/18.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    struct PropertyKeys {
        static let unwind = "SaveButton"
    }
    
    var athlete: Athlete?
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var leagueTextField: UITextField!
    
    @IBOutlet weak var teamTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let league = leagueTextField.text,
            let team = teamTextField.text else { return }
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        guard let athlete = athlete else { return }
        
        nameTextField.text = athlete.name
        ageTextField.text = athlete.age
        leagueTextField.text = athlete.league
        teamTextField.text = athlete.team
        
    }
    
    
    
    // MARK: - Navigation
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        if let source = segue.source as? AthleteTableViewController,
    //            let athlete = athlete {
    //            source.athletes.append(athlete)
    //        }
    //
    //    }
}
