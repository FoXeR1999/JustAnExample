//
//  MainTabBarController.swift
//  TabBar
//
//  Created by Justin Herzog on 10/5/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        
     let info = "I'm hyped for Super Mario Party. Super smash bros. hype. Super smash bros. is hype 2018 let go bois."
        
        for child in self.children where child is InfoViewController {
            guard let infoVC = child as? InfoViewController else { return }
            infoVC.setInfo(with: info)
        }
        
    }

}
