import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }
    
    @IBAction func UnwindToAthleteTable(segue: UIStoryboardSegue) {
        
        guard segue.identifier == "SaveButton" else { return }
        
        let sourceviewController = segue.source as! AthleteFormViewController
        
        if let athlete = sourceviewController.athlete {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                athletes[selectedIndexPath.row] = athlete
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: athletes.count, section: 0)
                athletes.append(athlete)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    // MARK: - Navigation
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue) {
//            if _ {
//
//            }
//        }
    }
