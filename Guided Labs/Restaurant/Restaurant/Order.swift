//
//  Order.swift
//  Restaurant
//
//  Created by Justin Herzog on 1/3/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
