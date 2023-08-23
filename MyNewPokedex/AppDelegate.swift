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
        
        let pokemonList = PokemonListViewController()
        let navigation = UINavigationController(rootViewController: pokemonList)
        window?.rootViewController = navigation
        return true
    }
}
