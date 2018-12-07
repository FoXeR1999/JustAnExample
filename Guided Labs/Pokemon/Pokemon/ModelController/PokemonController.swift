//
//  PokemonController.swift
//  Pokemon
//
//  Created by Justin Herzog on 12/6/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import Foundation

class PokemonController {
    
    ///////////////////////
    // MARK: Properties //
    /////////////////////
    
    static let baseURL = "http://pokeapi.co/api/v2/pokemon"
    
    ////////////////////
    // MARK: Methods //
    //////////////////
    
    static func getPokemon(searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        let searchURLString = baseURL + searchTerm.lowercased()
        
        _ = NetworkController.fetchPokemon(urlString: searchURLString, completion: { (pokemon) in
            completion(pokemon)
        })
    }
}
