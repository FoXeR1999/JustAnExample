//
//  GamesTableViewController.swift
//  ScoreKeeper
//
//  Created by Justin Herzog on 11/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class GamesTableViewController: UITableViewController {
    
    var games = [Game]()
    
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    // Have this do what the unwindToGamesTableViewController thing
    @IBAction func unwindFromPlayersTableView(segue: UIStoryboardSegue) {
        
    }
     
    @IBAction func unwindToGameTableView(segue: UIStoryboardSegue) {
        
        let gameViewControllerName = (segue.source as? GameViewController)?.name
        
        let game = Game(name: gameViewControllerName ?? "")
        
        games.append(game)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameViewCell", for: indexPath)
        
        // Configure the cell...
        
        let gameName = games[indexPath.row]
        
        cell.textLabel?.text = gameName.name
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let propertyListDecoder = PropertyListDecoder()
        
        let archiveURL = documentsDirectory.appendingPathComponent("games_test").appendingPathExtension("plist")
        
        if let retrievedGamesData = try? Data(contentsOf: archiveURL), let decodedGames = try? propertyListDecoder.decode([Game].self, from: retrievedGamesData) {
            print(decodedGames)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        let propertyListEncoder = PropertyListEncoder()
        
        let archiveURL = documentsDirectory.appendingPathComponent("games_test").appendingPathExtension("plist")
        
        let encodedGames = try? propertyListEncoder.encode(games)
        
        try? encodedGames?.write(to: archiveURL, options: .noFileProtection)
        
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let unwrappedScoresTableViewController = segue.destination as? ScoresTableViewController,
            let indexPath = tableView.indexPathForSelectedRow else { return }
        
        // gets the specific game they chose
        let game = games[indexPath.row]
        
        if segue.identifier == "scoreTableViewController" {
            unwrappedScoresTableViewController.game = game
    
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 

    ////////////////////
    // MARK: Saving  //
    //////////////////
    
   
    ////////////////////////////////////
    //        MARK: Functions        //
    //////////////////////////////////
    
}
