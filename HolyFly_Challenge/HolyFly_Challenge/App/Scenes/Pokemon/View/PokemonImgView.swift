//
//  PokemonImgView.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 24/04/24.
//

import SwiftUI

struct PokemonImage: View {
    
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image.resizable()
            } else if phase.error != nil {
                Color.secondary
            } else {
                ProgressView()
            }
        }
    }
}
