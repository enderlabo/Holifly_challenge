//
//  DetailView.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 24/04/24.
//

import SwiftUI

struct DetailView: View {
    
    let detailData: PokemonModel
    
    var body: some View {
        List {
            PokemonImage(url: detailData.sprites.front_default)
                .frame(width: 200, height: 200)
                .frame(maxWidth: .infinity, alignment: .center)
            Section("Abilities \(detailData.abilities.count)") {
                ForEach(detailData.abilities) { abilities in
                    Text(abilities.ability.name)
                }
            }
            Section("Moves \(detailData.moves.count)") {
                ForEach(detailData.moves) { moves in
                    Text(moves.detail.name)
                }
            }
        }.navigationTitle(detailData.name.capitalized)
    }
}

