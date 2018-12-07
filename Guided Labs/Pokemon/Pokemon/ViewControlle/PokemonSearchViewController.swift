//
//  PokemonSearchViewController.swift
//  Pokemon
//
//  Created by Justin Herzog on 12/6/18.
//  Copyright © 2018 Justin Herzog. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController {
    
    var pokemon: Pokemon? {
        didSet {
            DispatchQueue.main.sync {
                update(pokemon)
            }

        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    private func resetForm() {
        // searchBar.text = ""
        imageView.image = nil
        nameLabel.text = ""
        idLabel.text = ""
    }
    
    
    
    
    private func update(_ pokemon: Pokemon?) {
        if let pokemon = pokemon {
            nameLabel.text = pokemon.name
            idLabel.text = "\(pokemon.id)"
            
            if let imageURLString = pokemon.imageURLString {
                NetworkController.fetchPokemonImage(urlString: imageURLString) { (data) in
                    if let data = data {
                        let image = UIImage(data: data)
                        
                        DispatchQueue.main.sync {
                            self.imageView.image = image
                        }
                    }
                }
            }
            
        }
        
        
    }
    
}

extension PokemonSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        PokemonController.getPokemon(searchTerm: searchTerm) { (pokemon) in
            guard let pokemon = pokemon else {
                self.resetForm()
                DispatchQueue.main.sync {
                    let alertController = UIAlertController(title: "Not found", message: "The Pokemon you specified could not be found", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                return
            }
            self.pokemon = pokemon
            
        }
    }
}
