//
//  PokemonListViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import UIKit
import Kingfisher

class PokemonListViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pokemonCollection: UICollectionView!
    
    // MARK: constants
    let poke = PokemonApi()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationStyle(nav: navigationController!.self)
        ///Title
        titleLabel.text = "Pokedex"
        titleLabel.font = .boldSystemFont(ofSize: 36)
        
        ///Background
        self.view.backgroundColor = .white
        
        ///Collection
        pokemonCollection.dataSource = self
        pokemonCollection.delegate = self
        pokemonCollection.register(UINib(nibName: "PokemonCell",
                                         bundle: nil),
                                   forCellWithReuseIdentifier: "pokeCell")
    }
}

// MARK: Collection dataSource y Delegate
extension PokemonListViewController: UICollectionViewDataSource,
                                     UICollectionViewDelegate {
    /// Datasource
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        ///create cell
        let cell = pokemonCollection.dequeueReusableCell(withReuseIdentifier: "pokeCell",
                                                         for: indexPath) as! PokemonCell
        /// get pokemon by id in indexpath.row
        poke.getPokemonId(id: indexPath.row + 1) { pokemon in
            cell.configure(whit: pokemon)
        } failure: { error in
            print(error ?? "Error")
        }
     
        return cell
    }
    
    /// Delegate
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        poke.getPokemonId(id: indexPath.row + 1) { pokemon in
            let detail = PokemonDetailViewController(model: pokemon)
            self.navigationController?.showDetailViewController(detail, sender: nil)
        } failure: { error in
            self.titleLabel.text = "Error"
        }
        
    }
}
