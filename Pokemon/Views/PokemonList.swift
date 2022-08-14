//
//  PokemonList.swift
//  Pokemon
//
//  Created by Mac on 09/08/2022.
//

import SwiftUI

struct PokemonList: View {
  @State var pokemon = [PokemonEntry]()
    @StateObject var vm = ViewModel()
  @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter( {
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack {
                        Circle()
                        NavigationLink("\(entry.name)".capitalized,
                                       destination: Text("Detail view for \(entry.name)"))
                    }
                }
            }
        }
    }
}
    
    /* @StateObject var vm = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
                 var body: some View {
                     NavigationView {
                         ScrollView {
                             LazyVGrid(columns: adaptiveColumns, spacing: 10){
                                 ForEach(vm.filteredPokemon) { pokemon in
                                     PokemonView(pokemon: pokemon){
                                     NavigationLink("\(entry.name)".capitalized,
                                                    destination: Text("DetailView"))
                                        
                                     }
                                 }

                             }
                             .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                             .navigationTitle("Lista Pokemon")
                             .navigationBarTitleDisplayMode(.inline)
                         }
                         .searchable(text: $vm.searchText)
                     }
                     .environmentObject(vm)
                 }
             }
*/
