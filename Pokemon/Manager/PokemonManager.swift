//
//  PokemonManager.swift
//  Pokemon
//
//  Created by Mac on 11/08/2022.
//

import Foundation

class PokemonManager {
    
    func getPokemon() -> [PokemonEntry] {
        let data: PokemonInfo = Bundle.main.decode(file:"pokemon.json")
        let pokemon : [PokemonEntry] = data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion:@escaping (PokemonEntryDetail)-> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonEntryDetail.self) { data in
            completion(data)
            print(data)
        } failure: { error in
            print(error)
        }
    }
}
