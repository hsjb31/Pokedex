//
//  PokeCell.swift
//  Pokedex
//
//  Created by Harshal Solanki on 12/04/17.
//  Copyright © 2017 Harshal Solanki. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbimg :UIImageView!
    
    @IBOutlet weak var namelabel :UILabel!

    var pokemon : Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configurecell(_ pokemon : Pokemon){

        self.pokemon = pokemon
        namelabel.text = self.pokemon.name.capitalized
        thumbimg.image = UIImage(named : "\(self.pokemon.pokedexId)")
        
    }
}
