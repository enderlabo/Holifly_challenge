//
//  PokemonModel.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 22/04/24.
//

import Foundation

struct PokemonModel: Codable, Identifiable, Equatable, Hashable {

    var id: Int
    var name: String
    var abilities: [Abilities]
    var moves: [Move]
    var sprites: Sprites
    var types: [Types]
    
    static func == (lhs: PokemonModel, rhs: PokemonModel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Move: Identifiable, Codable, Hashable {
    let id = UUID()
    var detail: DetailedMove
    
    enum CodingKeys: String, CodingKey, Hashable {
        case detail = "move"
    }
    
    struct DetailedMove: Codable, Hashable {
        var name: String
        var url: URL
    }
}

struct Sprites: Codable, Hashable {
    var front_default: URL
}

struct Types: Identifiable, Codable, Hashable {
    let id = UUID()
    var type: PokemonType
    
    enum CodingKeys: String, CodingKey, Hashable {
        case type = "type"
    }
    
    struct PokemonType: Codable, Hashable {
        var name: String
        var url: URL
    }
}

struct Abilities:  Identifiable, Codable, Hashable {
    static func == (lhs: Abilities, rhs: Abilities) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    let id = UUID()
    var ability: PokemonAbilities
    
    enum CodingKeys: String, CodingKey {
        case ability = "ability"
    }
    
    func hash(into hasher: inout Hasher) {
            // Hash the properties of Abilities
        }
    
    struct PokemonAbilities: Codable {
        var name: String
        var url: URL
        
    }
    
}

struct PokemonIndex: Codable, Hashable {
    var count: Int
    var next: URL?
    var previous: URL?
    var results: [PokemonAnchor]
}

struct PokemonAnchor: Codable, Hashable {
    var name: String
    var url: URL
}
