//
//  Pokemon.swift
//  Pokemon
//
//  Created by Justin Herzog on 12/6/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    ///////////////////////
    // MARK: Properties //
    /////////////////////
    
    let id: Int
    let imageURLString: String?
    let name: String
    let sprites: [String: String?]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites
    }
    
    ////////////////////////
    // MARK: Initializer //
    //////////////////////
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try valueContainer.decode(Int.self, forKey: CodingKeys.id)
        name = try valueContainer.decode(String.self, forKey: CodingKeys.name)
        
        sprites = try valueContainer.decode([String: String?].self, forKey: CodingKeys.sprites)
        imageURLString = sprites["front_default"] ?? nil
    }
    
    
    
    static func fetchPokemonImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not access the Pokemon image URL.")
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data)
        }
        
        dataTask.resume()
    }
}
