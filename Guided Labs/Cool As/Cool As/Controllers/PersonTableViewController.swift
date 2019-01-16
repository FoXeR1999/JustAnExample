//
//  PersonTableViewController.swift
//  Cool As
//
//  Created by Justin Herzog on 1/15/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import CoreData

class PersonTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return PersonController.sharedPersonController.people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)

        // Configure the cell...
        let person = PersonController.sharedPersonController.people[indexPath.row]
        
        cell.textLabel?.text = person.name
        
        let emoji = EmojiController.sharedEmojiController.emojis[indexPath.row]
        
        cell.textLabel?.text = emoji.emoji

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let person = PersonController.sharedPersonController.people[indexPath.row]
        
        if editingStyle == .delete {
            PersonController.sharedPersonController.deletePerson(person: person)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEditPersonView" {
            guard let personDetailVC = segue.destination as? EditPersonViewController,
                let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            
            personDetailVC.loadViewIfNeeded()
            
            let person = PersonController.sharedPersonController.people[selectedRow]
            
            personDetailVC.person = person
        }
    }
    

}
