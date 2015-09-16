//
//  PokeCell.swift
//  Pokedex
//
//  Created by Muhammad Fauzi Masykur on 9/15/15.
//  Copyright (c) 2015 Muhammad Fauzi Masykur. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbImg: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var pokemon: Pokemon!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        nameLabel.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
