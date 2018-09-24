//
//  ViewController.swift
//  Apple Pie
//
//  Created by Justin Herzog on 9/24/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["lax", "ubiquitous", "railroad", "pneumonoultramicroscopicsilicovolcanoconiosis", "buy", "giraffe", "nose", "bee", "square", "lemonade", "autism", "grocery", "chip", "fertilizer", "moon", "piano", "squirrel", "definitely", "diamond", "classification", "ghastly", "enigmatic", "forest", "frog", "incredible", "orange", "noodle", "frolick", "gray", "night", "knight", "cake", "bed", "villager", "grass", "cobblestone", "command", "base", "varsity", "state", "form", "liquid", "zebra", "loquacious", "free", "estate", "administrate", "gravity", "run", "yesterday", "atomic", "radio", "desert", "quail", "dragonfly", "quick", "xylophone", "scary", "emerald", "yellow", "zealous", "blanket", "mind", "stars", "jupiter", "jail", "bouncy", "wheel", "thought", "horizon", "vertical", "ebola", "time", "dragon", "soup", "steamy", "hologram", "graph", "polish", "shine", "fuselage", "chicken", "juice", "serf", "king", "queen", "killer", "assassin", "legendary", "sonic", "pumpkin", "slash", "pancake", "hamburger", "present", "portal", "crevice", "salamander", "axolotl", "annual", "sugar", "barley", "motion", "rocket", "lightning", "clan", "tarantula", "emperor", "money", "patriot", "serenity", "tranquil", "teeth", "wisdom", "power", "courage", "leaf", "broken", "holocaust", "lyrics", "ewe", "cabinet", "coniferous", "trap", "oak", "fairy", "steel", "copper", "magenta", "ergonomic", "transverse", "strum", "guitar", "felony", "banana", "juxtapose", "transient", "euphoric", "venerate", "obsolete", "bright", "anonymity", "snide", "clairvoyance", "bivouac", "stellar", "frontier", "convoluted", "osculate", "formidable", "connoisseur", "lacuna", "pleonastic", "prolix", "prolific", "exhilarate", "tentative", "affable", "audacious", "pococurante", "naive", "quixotic", "proclivity", "admonish", "goddess", "blade", "quotes", "fate", "celebrity", "famous", "red", "preamble", "possess", "sinister", "ominous", "macabre", "jubilant", "sublime", "buccaneer", "incandescent"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        
    }

}

