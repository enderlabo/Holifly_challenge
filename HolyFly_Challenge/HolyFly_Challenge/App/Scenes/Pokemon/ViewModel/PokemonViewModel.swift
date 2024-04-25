//
//  PokemonViewModel.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 24/04/24.
//

import Foundation
import UIKit

@MainActor
final class PokemonViewModel: ObservableObject {
    @Published private var searchText = Constants.emptyString
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
            if let cachedData = loadDataFromDisk(fileName: "pokemonList") {
                pokemonList = try! JSONDecoder().decode([PokemonModel].self, from: cachedData)
                sortPokemons(by: lastOrderingMode)
                
                return
            }
            
            pokemonIndex = try await getData(
                by: firstCall ? URL(string: Constants.baseURL)! : self.pokemonIndex?.next
            )
            pokemonList.append(
                contentsOf: try await getPokemons())
            saveDataToDisk(try! JSONEncoder().encode(pokemonList), fileName: "pokemonList")
            
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
            return pokemon.name.localizedCaseInsensitiveContains(text) || 
            pokemon.types.contains{ 
                $0.type.name.localizedCaseInsensitiveContains(text) }  ||
            pokemon.abilities.contains{
                $0.ability.name.localizedCaseInsensitiveContains(text)
            }
        }
        
    }
    
    func backgroundColor(forType type:String) -> UIColor {
        switch type {
        case Constants.typeGrass: return .systemGreen
        case Constants.typeFire: return .systemRed
        case Constants.typeWater: return .systemBlue
        case Constants.typeElectric: return .systemYellow
        case Constants.typePhysic: return .systemPurple
        case Constants.typeNormal: return .systemOrange
        case Constants.typeGround: return .systemGray
        case Constants.typeFlying: return .systemCyan
        case Constants.typeFairy: return .systemTeal
        case Constants.typeFighting: return .systemGray2
        case Constants.typeRock: return .systemBrown
        
        default  :  return .systemIndigo
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
