//
//  ContentViewEnemy.swift
//  Pokemon
//
//  Created by Mac on 11/08/2022.
//

import SwiftUI

struct ContentViewEnemy: View {
    @StateObject var vm = ViewModel()
    
    let mypokemon: PokemonEntry
    let mynumero:Int
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
      
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(vm.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(mypokemonview: mypokemon,mynumeroview: mynumero,enemypokemonview: pokemon)
                        ) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("Escolha o Pokemon adversário")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }

}
