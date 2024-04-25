//
//  HolyFly_ChallengeApp.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 21/04/24.
//

import SwiftUI

@main
struct HolyFly_ChallengeApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var viewModel = PokemonViewModel()

    var body: some Scene {
        WindowGroup {
            PokemonView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(viewModel)
        }
    }
}
