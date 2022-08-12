//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Mac on 11/08/2022.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
                 var body: some View {
                     NavigationView {
                         ScrollView {
                             LazyVGrid(columns: adaptiveColumns, spacing: 10){
                                 ForEach(vm.filteredPokemon) { pokemon in
                                     
                                     NavigationLink(destination: ContentViewEnemy(mypokemon: pokemon,mynumero: vm.getPokemonIndex(pokemon: pokemon))
                                     ) {
                                         PokemonView(pokemon: pokemon)
                                     }
                                 }

                             }
                             .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                             .navigationTitle("Escolha o seu Pokemon")
                             .navigationBarTitleDisplayMode(.inline)
                         }
                         .searchable(text: $vm.searchText)
                     }
                     .environmentObject(vm)
                 }
             }

