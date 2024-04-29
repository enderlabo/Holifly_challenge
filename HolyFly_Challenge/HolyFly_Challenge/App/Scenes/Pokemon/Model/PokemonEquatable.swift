//
//  PokemonEquatable.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 29/04/24.
//

import Foundation

extension Pokemon: Equatable {
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    }
}

