//
//  PokemonIndex.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 29/04/24.
//

import Foundation

struct PokemonIndex: Codable {
    var count: Int
    var next: URL?
    var previous: URL?
    var results: [PokemonAnchor]
}
