//
//  DeckController.swift
//  Tap_Jack
//
//  Created by Justin Herzog on 1/25/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData

struct DeckController {
    
    let newDeckURL = URL(string: "https://deckofcardsapi.com/api/deck/")
        
    
    func getDeck(completion: @escaping ((Deck?) -> Void)) {
        
        guard let url = URL(string: "\(self.newDeckURL!)new/shuffle/?deck_count=1") else {
            print("Bad URL")
            return
        }
        
        NetworkController.performNetworkRequest(for: url) { (data, error) in
            guard let data = data else { return }
            
            do {
                let jsonObjects = try JSONSerialization.jsonObject(with: data)
                
                if let dictionary = jsonObjects as? Dictionary<String, Any> {
                    
                    guard let results = Deck(dictionary: dictionary) else {
                        print("Kuso")
                        return
                    }
                    
                    completion(results)
                }
            } catch {
                print(error)
            }
        }
    }
    
    func saveDeck(vDeck: Deck) {
        let deck = vDeck.deck_id
        let remaining = vDeck.remaining
        let success = vDeck.success
        
        let myDeck = Deck(context: CoreDataStack.context)
        myDeck.deck_id = deck
        myDeck.remaining = remaining
        myDeck.success = success
        saveToPersistantStorage()
    }
    
    func deleteDeck(vDeck: Deck) {
        CoreDataStack.context.delete(vDeck)
        saveToPersistantStorage()
    }
    
    func saveToPersistantStorage() {
        
        do {
            try CoreDataStack.context.save()
        } catch {
            print("くそ")
        }
    }
}
