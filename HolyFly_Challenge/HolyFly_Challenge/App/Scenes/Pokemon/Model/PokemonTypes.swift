//
//  PokemonTypes.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 29/04/24.
//

import Foundation

extension Pokemon {
    struct Types: Identifiable, Codable {
        let id = UUID()
        var type: PokemonType
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
        }

    }
}

extension Pokemon.Types {
    struct PokemonType: Codable, Hashable {
        var name: String
        var url: URL
    }
}
