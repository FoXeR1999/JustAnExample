//
//  Emoji.swift
//  Table View Controller Example thing
//
//  Created by Justin Herzog on 10/29/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

class Emoji {
    let symbol: String
    let name: String
    let description: String
    let usage: String
    
    init(symbol: String, name: String, description: String, usage: String) {
         self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
