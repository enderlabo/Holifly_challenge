//
//  PokemonViewCell.swift
//  HolyFly_Challenge
//
//  Created by Elderson Laborit on 22/04/24.
//

import SwiftUI

struct PokemonViewCell: View {
    var body: some View {
        
        ZStack {
            VStack(alignment: .center) {
                HStack {
                    Text("Charmander")
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
                        Text("Flying")
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

                    Text("Fire")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.black)
                                .opacity(0.15))
                    }
                    
                    Spacer()
                    Image("bulba")
                        .resizable()
                        .scaledToFill()
                        .padding(.bottom, 4)
                        .padding(.trailing, 4)
                        .frame(width: 50, height: 50)
                        .background(
                            Image("pokeball")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150)
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

#Preview {
    PokemonViewCell()
}
