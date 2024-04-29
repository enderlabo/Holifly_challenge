//
//  PokemonViewCell.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 22/04/24.
//

import SwiftUI

struct PokemonViewCell: View {
    let pokemonData: Pokemon
    @ObservedObject var viewModel = PokemonViewModel()
    @State private var typeName: String = Constants.emptyString
    
    init(pokemonData: Pokemon, viewModel: PokemonViewModel) {
        self.pokemonData = pokemonData
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .center) {
                HStack {
                    Text(pokemonData.name.capitalized)
                    Spacer()
                    Text(Constants.identifier + String(pokemonData.id))
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
                                .onAppear{
                                    self.typeName = type.type.name
                                    
                                }
                        }
                    }
                    
                    Spacer()
                    PokemonImage(url: pokemonData.sprites.front_default)
                        .scaledToFit()
//                    KFImage(url: pokemonData.sprites.front_default)
//                        .resizable()
//                        .scaledToFit()
                        .padding(.bottom, 4)
                        .padding(.trailing, 4)
                        .frame(width: Constants.spacing60, height: Constants.spacing60)
                        .background(
                            Image(Constants.pokeballImg)
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
        .background(Color(viewModel.backgroundColor(forType: typeName)))
        .cornerRadius(Constants.spacing20)
        .shadow(color: .gray, radius: 5)
    }
}

