//
//  PokemonViewCell.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 22/04/24.
//

import SwiftUI

struct PokemonViewCell: View {
    let pokemonData: PokemonModel
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .center) {
                HStack {
                    Text(pokemonData.name.capitalized)
                    Spacer()
                    Text("#001")
                }
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding([.top, .leading, .trailing], 15)
                
                .frame(maxWidth: .infinity)
                
                HStack() {
                    VStack (alignment: .leading){
                        ForEach(pokemonData.types) { type in
                            Text(type.type.name)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.black)
                                        .opacity(0.15)
                                )
                        }
                    }
                    
                    Spacer()
                    PokemonImage(url: pokemonData.sprites.front_default)
                        .padding(.bottom, 4)
                        .padding(.trailing, 4)
                        .frame(width: 60, height: 60)
                        .background(
                            Image("pokeball")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120)
                                .padding(.top, 50)
                                .padding(.leading, 20)
                        )
                }
                .padding()
                
            }
        }
        .background(.green)
        .cornerRadius(20)
        .shadow(color: .gray, radius: 5)
    }
}

