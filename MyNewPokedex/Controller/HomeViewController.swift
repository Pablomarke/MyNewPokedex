//
//  HomeViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 31/8/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeImage: UIImageView!
    
    @IBOutlet weak var stackOne: UIStackView!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonOne.backgroundColor = .black
        buttonTwo.backgroundColor = .red
        self.view.backgroundColor = .systemBlue
        homeImage.image = UIImage(named: "Poke")

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonOneAction(_ sender: Any) {
        let pokemonList = PokemonListViewController()
               
        self.navigationController?.show(pokemonList, sender: nil)
    }
    
    @IBAction func buttonTwoAction(_ sender: Any) {
        let poke = PokemonApi.shared
        poke.getPokemonId(id: 3) { pokemon in
            let p1 = Player(data: pokemon, hp: pokemon.stats[0].base_stat, atk: pokemon.stats[1].base_stat, def: pokemon.stats[2].base_stat)
            poke.getPokemonId(id: 9) { pokemon in
                let p2 = Player(data: pokemon,
                                hp: pokemon.stats[0].base_stat, atk: pokemon.stats[1].base_stat, def: pokemon.stats[2].base_stat)
                
                let pokemonList = CombatViewController(p1: p1, p2: p2,
                                                       combat: VsModeGame(player1: p1, player2: p2))
                
                self.navigationController?.show(pokemonList, sender: nil)

                
            } failure: { error in
                print(error!)
            }
        } failure: { error in
           print(error!)
       }
    }
    
}
