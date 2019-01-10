//
//  FriendsTableViewController.swift
//  Core_Data_Lab_1
//
//  Created by Justin Herzog on 1/7/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit
import CoreData


class FriendsTableViewController: UITableViewController {
    
    var friendsArray: [Friends]?
    
    func fetchFriendsValue() -> [Friends]? {
        let request = NSFetchRequest < NSFetchRequestResult > (entityName: "Friends")
        
        do {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let result = try context.fetch(request)
            if let result = result as? [Friends] {
                return result
            }
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "friendName") as! String)
                print("data group end")
            }
        } catch {
            print("failed to fetch data")
            return nil
        }
        return nil
    }
    
    @IBAction func AddButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Friend Name", message: "What's your friend's name?", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak alert] (_) in
            let alertTextField = alert!.textFields![0]
            uploadFriend()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
        
        func uploadFriend() {
            let friendName = alert.textFields![0].text
            if friendName?.count == 0 {
                return
            }
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Friends", in: context)
            let newFriend = NSManagedObject(entity: entity!, insertInto: context)
            newFriend.setValue("\(friendName!)", forKey: "friendName")
            
            do {
                try context.save()
                let friends = fetchFriendsValue()
                friendsArray = friends
                tableView.reloadData()
                print("uploaded Friend")
            } catch {
                print("failed saving")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsArray = fetchFriendsValue()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let unwrappedFriendsArray = friendsArray else { return 0 }
        
        return unwrappedFriendsArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
        
        guard let friend = friendsArray?[indexPath.row] else { return UITableViewCell() }
        
        cell.textLabel?.text = friend.friendName
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            guard let unwrappedFriendsArray = friendsArray else { return }
            
            context.delete(unwrappedFriendsArray[indexPath.row])
            
            do {
                friendsArray = fetchFriendsValue()
                try context.save()
                print("Saved")
            } catch {
                print("Didn't save")
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
