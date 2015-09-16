//
//  Pokemon.swift
//  Pokedex
//
//  Created by Muhammad Fauzi Masykur on 9/15/15.
//  Copyright (c) 2015 Muhammad Fauzi Masykur. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
    }
    
}
