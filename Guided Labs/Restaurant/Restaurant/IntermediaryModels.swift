//
//  IntermediaryModels.swift
//  Restaurant
//
//  Created by Justin Herzog on 1/3/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
