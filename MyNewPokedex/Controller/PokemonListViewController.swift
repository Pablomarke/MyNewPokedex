//
//  PokemonListViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import UIKit
import Kingfisher

class PokemonListViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pokemonCollection: UICollectionView!
    let poke = PokemonApi()
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Title
        titleLabel.text = "Pokedex"
        titleLabel.font = .boldSystemFont(ofSize: 36)
        
        ///Collection
        pokemonCollection.dataSource = self
        pokemonCollection.delegate = self
        pokemonCollection.register(UINib(nibName: "PokemonCell",
                                         bundle: nil),
                                   forCellWithReuseIdentifier: "pokeCell")
        
        self.view.backgroundColor = .white
    }
}

extension PokemonListViewController: UICollectionViewDataSource,
                                     UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = pokemonCollection.dequeueReusableCell(withReuseIdentifier: "pokeCell",
                                                         for: indexPath) as! PokemonCell
        
        poke.getPokemonId(id: indexPath.row + 1) { pokemon in
            cell.pokeName.text = pokemon.name.firstUpper()
            cell.backView.backgroundColor = pokemon.pokeColor()
            
            let myurl = URL(string: pokemon.sprites!.other.officialArtwork.front_default)
            cell.pokeImage.kf.setImage(with: myurl)
            cell.typeLabel.text = pokemon.types?[0].type?.name
            if pokemon.types?.count == 2 {
             cell.type2Label.text = pokemon.types?[1].type?.name
            } else {
                cell.type2Label.isHidden = true
                cell.type2View.isHidden = true
            }
        } failure: { error in
            print(error ?? "Error")
        }
     
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        poke.getPokemonId(id: indexPath.row + 1) { pokemon in
            let detail = PokemonDetailViewController(model: pokemon)
            self.navigationController?.pushViewController(detail,
                                                     animated: true)
        } failure: { error in
            self.titleLabel.text = "Error"
        }

    }
}
