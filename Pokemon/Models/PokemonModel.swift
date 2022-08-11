//
//  Pokemon.swift
//  Pokemon
//
//  Created by Mac on 03/08/2022.
//

// https://pokeapi.co/api/v2/pokemon?limit=151

import Foundation

struct PokemonInfo : Codable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable, Equatable {
    let id = UUID()
    var name: String
    var url: String
    
    static var samplePokemon = PokemonEntry(name : "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    
    //var pokemonSelected : String
}


struct PokemonEntryDetail: Codable, Identifiable {
    let id: Int
    let height: Int
    let weight: Int
    let stats: [Stat]
    let types: [Types]
}

struct Stat: Codable {
    var base_stat: Int
    var effort: Int
}

struct Types: Codable {
    var types: TypeInfo
}

struct TypeInfo: Codable {
    var name: String
}

//class PokeAPI {
//    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
//        guard let url = URL(string:"https://pokeapi.co/api/v2/pokemon?limit=151") else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { return }
//
//            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
//
//            DispatchQueue.main.async {
//                completion(pokemonList.results)
//            }
//        }.resume()
//
//    }
    
//    func selectPokemon(pokemonSelectedInView: String?){
//        let pokemonSelected = pokemonSelectedInView
//        print(pokemonSelected)
//    }
//}
