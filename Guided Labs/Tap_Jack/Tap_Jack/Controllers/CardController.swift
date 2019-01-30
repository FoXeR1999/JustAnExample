//
//  CardController.swift
//  Tap_Jack
//
//  Created by Justin Herzog on 1/25/19.
//  Copyright © 2019 Justin Herzog. All rights reserved.
//

import Foundation
import CoreData
import UIKit

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
                    let jsonObjects = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    
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
    
    func getCardURL(completion: @escaping (([UIImage]) -> Void)) {
        
        var imageArray: [UIImage] = []
        
        _ = getCards(completion: { (cardsArray) in
            
            guard let cardsArray = cardsArray else { return }
            
            for card in cardsArray {
                guard let unwrappedImage = card.image,
                    let imageURL = URL(string: unwrappedImage) else { return }
                
                NetworkController.performNetworkRequest(for: imageURL, completion: { (data, error) in
                    guard let data = data,
                        let image = UIImage(data: data) else { return }
                    imageArray.append(image)
                    
                    if imageArray.count == 52 {
                        completion(imageArray)
                    }
                })
            }
        })
    }
}
