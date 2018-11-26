//
//  employeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Justin Herzog on 11/26/18.
//

import UIKit

protocol EmployeeTypeDelegate {
    func didSelect(employeeType: EmployeeType)
}

class employeeTypeTableViewController: UITableViewController {

    struct PropertyKeys {
        static let employeeTypeCell = "employeeTypeCell"
    }
    
    var employeeType: EmployeeType?
    var delegate: EmployeeTypeDelegate?

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.employeeTypeCell, for: indexPath)

        let type = EmployeeType.all[indexPath.row]
        cell.textLabel?.text = type.description()
        
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        employeeType = EmployeeType.all[indexPath.row]
        delegate?.didSelect(employeeType: employeeType!)
        tableView.reloadData()
    }
    
}
