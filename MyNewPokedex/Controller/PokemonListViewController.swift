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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        ///Title
        titleLabel.text = "POKEDEX"
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
        
        let poke = PokemonApi()
        let cell = pokemonCollection.dequeueReusableCell(withReuseIdentifier: "pokeCell",
                                                         for: indexPath) as! PokemonCell
        
        poke.getPokemonId(id: indexPath.row + 1) { pokemon in
            cell.pokeName.text = pokemon.name
            
            if pokemon.types?[0].type?.name == "water" {
                cell.backView.backgroundColor = .systemBlue
            } else if pokemon.types?[0].type?.name == "fire" {
                cell.backView.backgroundColor = .systemRed
            } else if pokemon.types?[0].type?.name == "bug" {
                cell.backView.backgroundColor = .systemBrown
            } else if pokemon.types?[0].type?.name == "normal" {
                cell.backView.backgroundColor = .systemGray
            } else {
                cell.backView.backgroundColor = .systemMint
            }
            
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
    
    
}
