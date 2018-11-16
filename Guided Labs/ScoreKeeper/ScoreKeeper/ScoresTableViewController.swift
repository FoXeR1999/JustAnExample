//
//  ScoresTableViewController.swift
//  ScoreKeeper
//
//  Created by Justin Herzog on 11/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class ScoresTableViewController: UITableViewController {
    
    var game: Game?
    
    ////////////////////
    // MARK: Methods //
    //////////////////
    
    // Connect this to the game nav bar item in the scores Table View
    @IBAction func unwindToGamesTableViewController(_ sender: Any) {
        performSegue(withIdentifier: "unwindFromPlayersTableViewController", sender: self)
    }
    
    @IBAction func unwindToScoresTableView(segue: UIStoryboardSegue) {
        
        let scoresViewControllerName = (segue.source as? ScoreViewController)?.playerName
        
        let player = Player(name: scoresViewControllerName)
        
        game?.players.append(player)
        

        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let unwrappedGame = game {
            return unwrappedGame.players.count
        } else {
            return 0
        }

    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "playerScoresCell", for: indexPath) as? ScoresTableViewCell else { return UITableViewCell() }

        // Configure the cell...

        if let unwrappedGame = game {
            
            let playerName = unwrappedGame.players[indexPath.row].name
            
            cell.playerLabel?.text = playerName
        }
        
        cell.updateCell()
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
