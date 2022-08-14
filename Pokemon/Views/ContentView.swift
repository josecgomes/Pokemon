//
//  ContentView.swift
//  Pokemon
//
//  Created by Mac on 03/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showPokemonListView = false
    @State private var showPokemonBattle = false
    @State private var showPokemonBatleHistoric = false
    
    var body: some View {
     NavigationView{
            VStack {
                Button(action: { showPokemonListView = true }) {
                    Text("Lista Pokemons")
                }
                NavigationLink("", destination: PokemonList(), isActive: $showPokemonListView)
                
                Button(action:  { showPokemonBattle = true }) {
                    Text("Batalha")
                }
                NavigationLink("", destination: PokemonListView(), isActive: $showPokemonBattle)
                
                Button(action:  { showPokemonBatleHistoric = true }) {
                    Text("Histórico de Batalhas")
                }
                NavigationLink("", destination: PokemonListView(), isActive: $showPokemonBatleHistoric)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
