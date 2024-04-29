//
//  PokemonAbilities.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 29/04/24.
//

import Foundation

extension Pokemon {
    struct Abilities: Identifiable, Codable, Hashable {
        let id = UUID()
        var ability: PokemonAbilities
        
        enum CodingKeys: String, CodingKey {
            case ability = "ability"
        }
    }
}

extension Pokemon.Abilities {
    struct PokemonAbilities: Codable, Hashable {
        var name: String
        var url: URL
    }
}
