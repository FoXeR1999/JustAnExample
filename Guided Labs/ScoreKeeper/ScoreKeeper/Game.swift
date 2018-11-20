//
//  Game.swift
//  ScoreKeeper
//
//  Created by Justin Herzog on 11/14/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import Foundation

struct Game: Codable {
    let name: String?
    var players: [Player] = []
    
    init(name: String) {
        self.name = name
        self.players = []
    }
}

