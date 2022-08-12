//
//  ViewModel.swift
//  Pokemon
//
//  Created by Mac on 11/08/2022.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [PokemonEntry]()
    @Published var pokemonDetails: PokemonEntryDetail?
    var pokemonDetailsHP: Int
    var pokemonDetailsAtack: Int
    @Published var searchText = ""
    
    var filteredPokemon: [PokemonEntry] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased()) }
    }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
        self.pokemonDetailsHP = 0
        self.pokemonDetailsAtack = 0
    }
    
    func getPokemonIndex(pokemon: PokemonEntry) -> Int {
        if let index =  self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: PokemonEntry) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = PokemonEntryDetail(id: 0, height: 0, weight: 0, stats: [Stat(base_stat: 10,effort: 10)], types: [Types(types: TypeInfo(name: "Normal"))])
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
}
 
    func getDetailsHP(id: Int) -> Int {
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsHP = data.stats[0].base_stat
            }
        }
        
        return pokemonDetailsHP
   }
    
    func getDetailsAtack(id: Int) -> Int {
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetailsAtack = data.stats[1].base_stat
            }
        }
        
        return pokemonDetailsAtack
   }
    
    func formatHeightWeight(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    
    
    
    
}
