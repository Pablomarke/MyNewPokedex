//
//  PokemonListViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import UIKit
import Kingfisher

final class PokemonListViewController: UIViewController {
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pokemonCollection: UICollectionView!
    
    // MARK: properties
    let poke = PokemonApi()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configCollectionView()
    }
}

private extension PokemonListViewController {
    func configView() {
        if let navi = navigationController {
            navigationStyle(nav: navi)
        }

        titleLabel.text = "Pokedex"
        titleLabel.font = .boldSystemFont(ofSize: 36)
    }
    
    func configCollectionView() {
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
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = pokemonCollection.dequeueReusableCell(withReuseIdentifier: "pokeCell",
                                                         for: indexPath) as! PokemonCell
        poke.getPokemonId(id: indexPath.row + 1) { pokemon in
            cell.configure(whit: pokemon)
        }
        return cell
    }
    
    func collectionView( _ collectionView: UICollectionView,
                         didSelectItemAt indexPath: IndexPath) {
        poke.getPokemonId(id: indexPath.row + 1) { pokemon in
            let detail = PokemonDetailViewController(model: pokemon)
            self.navigationController?.showDetailViewController(detail,
                                                                sender: nil)
        }
    }
}
