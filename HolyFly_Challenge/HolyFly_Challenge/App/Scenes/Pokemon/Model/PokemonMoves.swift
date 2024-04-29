//
//  PokemonMoves.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 29/04/24.
//

import Foundation

extension Pokemon {
    struct Move: Identifiable, Codable {
        let id = UUID()
        var detail: DetailedMove
        
        enum CodingKeys: String, CodingKey {
            case detail = "move"
        }
    }
}

extension Pokemon.Move {
    struct DetailedMove: Codable, Hashable {
        var name: String
        var url: URL
    }
}
