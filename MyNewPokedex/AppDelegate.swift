//
//  AppDelegate.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import UIKit

@main
class AppDelegate: UIResponder,
                   UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let poke = PokemonApi.shared
        poke.getPokemonId(id: 3) { pokemon in
            let p1 = Player(data: pokemon, hp: pokemon.stats[0].base_stat, atk: pokemon.stats[1].base_stat, def: pokemon.stats[2].base_stat)
            poke.getPokemonId(id: 9) { pokemon in
                let p2 = Player(data: pokemon,
                                hp: pokemon.stats[0].base_stat, atk: pokemon.stats[1].base_stat, def: pokemon.stats[2].base_stat)
                let pokemonList = CombatViewController(p1: p1, p2: p2, combat: VsModeGame(player1: p1, player2: p2))
                let navigation = UINavigationController(rootViewController: pokemonList)
                self.window?.rootViewController = navigation
                
            } failure: { error in
                print(error!)
            }
        } failure: { error in
           print(error!)
       }
        
        return true
        
    }
}
        
        
        
  
