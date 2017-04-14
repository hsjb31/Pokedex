//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Harshal Solanki on 14/04/17.
//  Copyright © 2017 Harshal Solanki. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    var pokemon : Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLabel.text = pokemon.name
        
    }


}
