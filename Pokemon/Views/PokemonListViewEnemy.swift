//
//  PokemonListViewEnemy.swift
//  Pokemon
//
//  Created by Mac on 11/08/2022.
//

import SwiftUI

struct PokemonListViewEnemy: View {
    @EnvironmentObject var vm: ViewModel
    let pokemon: PokemonEntry
    let dimensions: Double = 80
      
    var body: some View {
        VStack {
            AsyncImage(url: URL(string:
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: dimensions, height: dimensions)
                }
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
            }
            .background(.thinMaterial)
            .clipShape(Circle())
            
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
                .padding(.bottom, 20)
        }
    }
}


struct PokemonListViewEnemy_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: PokemonEntry.samplePokemon)
            .environmentObject(ViewModel())
    }
}
