//
//  InfoViewController.swift
//  TabBar
//
//  Created by Justin Herzog on 10/5/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet private var infoLabel: UILabel!
    
    func setInfo(with info: String) {
        self.infoLabel.text = info
        self.loadViewIfNeeded()
    }
    
}
