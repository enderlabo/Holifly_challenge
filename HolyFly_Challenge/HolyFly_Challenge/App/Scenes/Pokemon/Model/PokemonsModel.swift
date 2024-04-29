//
//  PokemonsModel.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 29/04/24.
//

import Foundation


struct Pokemon: Identifiable, Codable, Hashable{
    var id: Int
    var name: String
    var abilities: [Abilities]
    var moves: [Move]
    var species: Species
    var sprites: Sprites
    var types: [Types]

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
