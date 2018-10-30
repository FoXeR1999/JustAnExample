//
//  FoodTableViewController.swift
//  Another Example With Toby
//
//  Created by Justin Herzog on 10/30/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meal: [Meal] {
        return [Meal(name: "Breakfast", food: [pancakes]), Meal(name: "Lunch", food: [sandwich]), Meal(name: "Dinner", food: [sushi])]
    }
    
    let pancakes = Food(name: "Pancakes", description: "Round fluffy bread lathered with syrup.")
    
    let sandwich = Food(name: "Sandwich", description: "Things imbetween two pieces of bread.")
    
    let sushi = Food(name: "Sushi", description: "Fish and rice wrapped in seaweed.")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meal.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meal[section].food.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath)
        
        cell.textLabel?.text = meal[indexPath.section].food[indexPath.row].name
        cell.detailTextLabel?.text = meal[indexPath.section].food[indexPath.row].description
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meal[section].name
    }
}
