//
//  PokemonDetailView.swift
//  Pokemon
//
//  Created by Mac on 11/08/2022.
//

import SwiftUI


struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    
    let mypokemonview: PokemonEntry
    let mynumeroview: Int
    
    let enemypokemonview: PokemonEntry
    
    @State private var progress = 100.0
    @State private var progress_enemy = 100.0
    @State private var attackDisabled = false
    @State private var showAlert =  false

        
    var body: some View {
        
        
        VStack {
            PokemonListViewEnemy(pokemon: enemypokemonview)
        }
        .onAppear {
            vm.getDetails(pokemon: enemypokemonview)
        }
        .position(x: 270, y: 150)
        
        
        
        VStack(spacing: 10) {
            Text("**Hp**: \(vm.pokemonDetails?.stats[0].base_stat ?? 999)")
            Text("**Atack**: \(vm.getDetailsAtack(id:mynumeroview))")
            
            ProgressView("Hp",value: progress,total: 100)
                .tint(Color.green)
                .shadow(color: Color(red: 0, green: 0.6, blue: 0), radius: 4.0, x: 1.0, y: 2.0)
                .scaleEffect(0.5,anchor: .center)

        }
        .padding()
        .position(x: 100, y: 0)
        

                
        VStack {
            PokemonViewSelected(pokemon: mypokemonview,numero: mynumeroview)
        }
        .onAppear {
            vm.getDetails(pokemon: mypokemonview)
        }
        .position(x: 100, y: 200)
        
        
        
        VStack(spacing: 10) {
            Text("**Hp**: \(vm.pokemonDetails?.stats[0].base_stat ?? 999)")
            Text("**Atack**: \(vm.getDetailsAtack(id:mynumeroview))")
            
            //pokemonDetailsAtack = data.stats[1].base_stat
            
            ProgressView("Hp",value: progress_enemy,total: 100)
                .tint(Color.green)
                .shadow(color: Color(red: 0, green: 0.6, blue: 0), radius: 4.0, x: 1.0, y: 2.0)
                .scaleEffect(0.5,anchor: .center)
                

        }
        .padding()
        .position(x: 270, y: 40)
        
        
        
        VStack(spacing: 10) {
            
            Button("Fight", action: {
                attackDisabled = true
                progress_enemy -= Double.random(in: 0..<20)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                    progress -=  Double.random(in: 0..<20)
                    attackDisabled = false
                }
                    
            }).disabled(attackDisabled)
            
        }
        .padding()
        .position(x: 190, y: 80)
    }
    
}

