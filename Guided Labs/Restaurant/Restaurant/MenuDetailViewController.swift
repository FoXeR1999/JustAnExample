//
//  MenuDetailViewController.swift
//  Restaurant
//
//  Created by Justin Herzog on 1/3/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var addToOrderButton: UIButton!
    
    var menuItem: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addToOrderButton.layer.cornerRadius = 5.0
        updateUI()
        
    }
    
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        descriptionLabel.text = menuItem.detailText
    }
    
    @IBAction func addToOrderButtonTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.125, animations: {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { _ in
            UIView.animate(withDuration: 0.125) {
                self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
                self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
        
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
