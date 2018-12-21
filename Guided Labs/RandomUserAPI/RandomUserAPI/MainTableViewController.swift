//
//  MainTableViewController.swift
//  RandomUserAPI
//
//  Created by Justin Herzog on 12/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var userArray: [User] = []
    
    var networkController = NetworkController()
    
    var mainTableViewCell = MainTableViewCell()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    func fetchSearchTermAndData() {
        
        let searchTerm = searchBar.text ?? ""
        
        if !searchTerm.isEmpty {
            
            networkController.fetchRandomUsers(searchTerm: searchTerm) { (results) in
                DispatchQueue.main.async {
                    if let results = results {
                        self.userArray = results
                        self.tableView.reloadData()
                    }
                }
                
            }
            
            
        }
        
        self.tableView.reloadData()
        
    }
    
    func configureCell(cell: MainTableViewCell, indexPath: IndexPath) {
        
        let user = userArray[indexPath.row]
        
        cell.nameLabel.text = user.firstName + " " + user.lastName
        
        cell.genderLabel.text = user.gender
        
        cell.ageLabel.text = String(user.age)
        
        guard let unwrappedPictureURL = URL(string: user.thumbnailPicture) else { return }
        
        
        URLSession.shared.dataTask(with: unwrappedPictureURL) { (data, response, error) in
            guard let data = data,
                let thumbnailPicture = UIImage(data: data) else { return }
            cell.thumbnailPicture = thumbnailPicture
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}
////////////////////////
// MARK:  Extensions //
//////////////////////

extension MainTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchSearchTermAndData()
        searchBar.resignFirstResponder()
        
    }
    
}
