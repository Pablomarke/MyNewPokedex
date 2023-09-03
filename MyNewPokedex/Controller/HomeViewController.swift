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
        self.view.backgroundColor = .white
        
        buttonOne.tintColor = .systemBlue
        buttonOne.setTitle("Pokemons", for: .normal)
        
        buttonTwo.tintColor = .systemYellow
        buttonTwo.setTitle("Combat simulator", for: .normal)
        
        homeImage.image = UIImage(named: "Poke")
    }
    
    @IBAction func buttonOneAction(_ sender: Any) {
        let pokemonList = PokemonListViewController()
        self.navigationController?.show(pokemonList, sender: nil)
    }
    
    @IBAction func buttonTwoAction(_ sender: Any) {
        let select = SelectPokemonViewController()
        self.navigationController?.show(select, sender: nil)
    }
    
}
