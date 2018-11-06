//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Justin Herzog on 11/5/18.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        if let unwrappedAthlete = athlete {
            nameTextField.text = unwrappedAthlete.name
            ageTextField.text = unwrappedAthlete.age
            leagueTextField.text = unwrappedAthlete.league
            teamTextField.text = unwrappedAthlete.team
        }
        
    }
}

/*
  MARK: - Navigation
 
  In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
  Get the new view controller using segue.destination.
  Pass the selected object to the new view controller.
 }
 */
