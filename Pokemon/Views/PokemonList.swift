//
//  PokemonList.swift
//  Pokemon
//
//  Created by Mac on 09/08/2022.
//

/*import SwiftUI

struct PokemonList: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    var body: some View {

            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter( {
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack {
                        PokemonImage(imageLink: "\(entry.url)")
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized,
                                       destination:
                                        VStack {
                            Text(" \(entry.name)".capitalized)
                            PokemonImageAboutView(imageLink: "\(entry.url)")
                        }
                                    )
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Nome Pokemon")
            .onAppear {
              //  PokeAPI().getData() { pokemon in
                //    self.pokemon = pokemon
              //  }
            }

            .padding(0)

        }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
*/
