//
//  CardController.swift
//  Tap_Jack
//
//  Created by Justin Herzog on 1/25/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData

struct CardController {
    
    let newDeckURL = URL(string: "https://deckofcardsapi.com/api/deck/")
    
    let deckController = DeckController()
    
    func getCards(completion: @escaping (([Cards]?) -> Void)) {
        
        _ = deckController.getDeck(completion: { (results) in
            
            guard let url = URL(string: "\(self.newDeckURL!)\((results?.deck_id)!)/draw/?count=52") else {
                print("bad URL")
                return
            }
            
            NetworkController.performNetworkRequest(for: url, completion: { (data, error) in
                guard let data = data else { return }
                
                do {
                    let jsonObjects = try JSONSerialization.jsonObject(with: data)
                    
                    if let dictionary = jsonObjects as? Dictionary<String, Any> {
                        
                        guard let cards = dictionary["cards"] as? [Dictionary<String, Any>] else {
                            
                            
                            print("Kuso")
                            return
                        }
                        
                        var cardsArray: [Cards] = []
                        for card in cards  {
                            if let singleCard = Cards(dictionary: card) {
                                cardsArray.append(singleCard)
                            }
                        }
                        
                        completion(cardsArray)
                    }
                    
                } catch {
                    print(error)
                }
            })
        })
    }
}
