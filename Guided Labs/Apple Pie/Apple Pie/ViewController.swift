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
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        if currentGame.incorrectMovesRemaining == 0 {
            updateUI()
            correctWordLabel.text = currentGame.word
            nextGame.isEnabled = true
            nextGame.isHidden = false
            for i in letterButtons {
                i.isEnabled = false
            }
        }
    }
    
    @IBOutlet weak var nextGame: UIButton!
    
    @IBAction func nextGame(_ sender: UIButton) {
        newRound()
        sender.isEnabled = false
        sender.isHidden = true
    }
    
    
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            newRound()
        } else {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextGame.isEnabled = false
        newRound()
    }
    
    var currentGame: Game!
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.remove(at: Int(arc4random_uniform(UInt32(listOfWords.count))))
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
        
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
}

