//
//  PokemonView.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 22/04/24.
//

import SwiftUI

struct PokemonView: View {
    private let colums = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: colums, spacing: 15) {
                        ForEach(1..<19) { _ in
                            PokemonViewCell()
                        }
                    }
                }
                .navigationTitle("Pokédex")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.all, 10)
        }
       
    }
}

#Preview {
    PokemonView()
}
