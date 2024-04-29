//
//  PokemonView.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 22/04/24.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject private var viewModel: PokemonViewModel
    @State private var searchField: String = Constants.emptyString
    private let colums = [GridItem(.flexible()), GridItem(.flexible())]
    
    var filteredPokemonList: [Pokemon] {
        if searchField.isEmpty {
            return viewModel.pokemonList
        } else {
            return viewModel.pokemonFiltered
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: colums, spacing: Constants.spacing15) {
                        ForEach(filteredPokemonList,  id: \.self) { item in
                            NavigationLink{
                                DetailView(detailData: item)
                            } label: {
                                PokemonViewCell(pokemonData: item, viewModel: viewModel)
                            }.task {
                                if item == viewModel.pokemonList.last {
                                    print("Pagination")
                                    await viewModel.loadPokemons()
                                }
                            }
                            
                        }
                        
                    }
                    .navigationTitle(Constants.navigationTitle)
                    .searchable(text: $searchField, placement: .toolbar, prompt: Constants.searchFieldPrompt)
                    .task {
                        await viewModel.loadPokemons(firstCall: true)
                    }
                    .onChange(of: searchField ) { oldValue, NewValue in
                        viewModel.filterPokemons(by: NewValue)
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.all, 10)
                
            }
            
        }
        
    }
    
    struct PokemonView_Previews: PreviewProvider {
        static var previews: some View {
            PokemonView()
                .environmentObject(PokemonViewModel())
        }
    }
}
