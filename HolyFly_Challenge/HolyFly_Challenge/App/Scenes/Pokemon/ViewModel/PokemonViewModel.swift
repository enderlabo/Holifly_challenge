//
//  PokemonViewModel.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 24/04/24.
//

import Foundation

@MainActor
final class PokemonViewModel: ObservableObject {
    @Published private var searchText = ""
    private let networkService = NetworkService()
    private var pokemonIndex: PokemonIndex?
    @Published private(set) var pokemonList: [PokemonModel] = []
    @Published private(set) var pokemonFiltered: [PokemonModel] = []
    private var lastOrderingMode: OrderMode = .standard
    
    
    private func getPokemons() async throws -> [PokemonModel] {
        return try await withThrowingTaskGroup(of: PokemonModel.self) { group in
            
            var results: [PokemonModel] = []
            
            guard let pokemonIndex = pokemonIndex else {
                throw Error.missingPokemonIndex
            }
            
            for url in pokemonIndex.results.map({ $0.url }) {
                group.addTask() {
                    return try await self.getData(by: url)
                }
            }
            
            for try await pokemon in group {
                results.append(pokemon)
            }
            return results
        }
    }
    
    func loadPokemons(firstCall: Bool = false) async {
        do {
            pokemonIndex = try await getData(
                by: firstCall ? URL(string: "https://pokeapi.co/api/v2/pokemon/")! : self.pokemonIndex?.next
            )
            pokemonList.append(
                contentsOf: try await getPokemons())
            
            sortPokemons(by: lastOrderingMode)
        } catch {
            print(error)
        }
    }
    
    func sortPokemons(by mode: OrderMode) {
        
        lastOrderingMode = mode
        switch mode {
        case .standard:
            pokemonList.sort(by: { $0.id < $1.id })
        }
    }
    
    func filterPokemons(by text: String) {
        pokemonFiltered = pokemonList.filter{ pokemon in
            return pokemon.name.localizedCaseInsensitiveContains(text) || pokemon.types.contains{ $0.type.name.localizedCaseInsensitiveContains(text) }
        }
        
    }
    
}

extension PokemonViewModel {
    
    private func getData<T:Codable>(by url: URL?) async throws -> T {
        guard let url = url else {
            throw Error.invalidURL
        }
        return try await networkService.fetchObject(for: url)
    }
}

extension PokemonViewModel {
    
    enum OrderMode: String, CaseIterable {
        case standard = "Standard"
    }
    
    enum Error: LocalizedError {
        case invalidURL
        case missingPokemonIndex
    }
}
