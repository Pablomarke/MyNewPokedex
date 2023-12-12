//
//  SelectPokemonViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 2/9/23.
//

import UIKit

class SelectPokemonViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var p1LabelView: UIView!
    @IBOutlet weak var p1Label: UILabel!
    @IBOutlet weak var p2LabelView: UIView!
    @IBOutlet weak var p2Label: UILabel!
    
    @IBOutlet weak var p1Collection: UICollectionView!
    @IBOutlet weak var p1SelectedImage: UIImageView!
    @IBOutlet weak var p2Collection: UICollectionView!
    @IBOutlet weak var p2SelectedImage: UIImageView!
    @IBOutlet weak var actionButton: UIButton!
    
    
    let poke = PokemonApi()
    var player1Poke: Int = 1
    var player2Poke: Int = 4
   
    // MARK: Viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Select your pokemon!"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.textColor = .systemYellow
        navigationStyle(nav: navigationController!.self)
        
        p1SelectedImage.isHidden = true
        p2SelectedImage.isHidden = true
        actionButton.isHidden = true
        
        p1LabelView.layer.cornerRadius = 22
        p2LabelView.layer.cornerRadius = 22
        p1Label.text = "Player 1 pokemon"
        p2Label.text = "Player 2 pokemon"
        
        ///collectionViews
        p1Collection.backgroundColor = .clear
        p2Collection.backgroundColor = .clear
        p1Collection.dataSource = self
        p1Collection.register(UINib(nibName: "PokemonCell",
                                    bundle: nil),
                              forCellWithReuseIdentifier: "pokeCell")
        p1Collection.delegate = self
        p2Collection.dataSource = self
        p2Collection.register(UINib(nibName: "PokemonCell",
                                    bundle: nil),
                              forCellWithReuseIdentifier: "pokeCell")
        p2Collection.delegate = self
    }
    
    // MARK: Buttons
    @IBAction func testaction(_ sender: Any) {
        let poke = PokemonApi.shared
        poke.getPokemonId(id: player1Poke) { pokemon in
            let p1 = Player(data: pokemon, hp: pokemon.stats[0].base_stat, atk: pokemon.stats[1].base_stat, def: pokemon.stats[2].base_stat)
            poke.getPokemonId(id: self.player2Poke) { pokemon in
                let p2 = Player(data: pokemon,
                                hp: pokemon.stats[0].base_stat, atk: pokemon.stats[1].base_stat, def: pokemon.stats[2].base_stat)
                
                let pokemonList = CombatViewController(p1: p1, p2: p2,
                                                       combat: VsModeGame(player1: p1, player2: p2))
                
                self.navigationController?.show(pokemonList, sender: nil)
            }
        }
    }
}

// MARK: Collection Datasource
extension SelectPokemonViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        return 50
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = p1Collection.dequeueReusableCell(withReuseIdentifier: "pokeCell",
                                                    for: indexPath) as! PokemonCell
        if collectionView == p1Collection {
            let cell = p1Collection.dequeueReusableCell(withReuseIdentifier: "pokeCell",
                                                        for: indexPath) as! PokemonCell
                /// get pokemon by id in indexpath.row
                poke.getPokemonId(id: indexPath.row + 1) { pokemon in
                    cell.configure(whit: pokemon)
                }
                return cell
        } else if collectionView == p2Collection {
            let cell = p2Collection.dequeueReusableCell(withReuseIdentifier: "pokeCell",
                                                        for: indexPath) as! PokemonCell
                /// get pokemon by id in indexpath.row
                poke.getPokemonId(id: indexPath.row + 1) { pokemon in
                    cell.configure(whit: pokemon)
                } 
                return cell
        }
        return cell
    }
}
// MARK: Collection delegate
extension SelectPokemonViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
       
        if collectionView == p1Collection {
            player1Poke = indexPath.row + 1
            p1Collection.isHidden = true
            p1SelectedImage.isHidden = false
            let cell2 =  p1Collection.cellForItem(at: indexPath) as! PokemonCell
            p1LabelView.backgroundColor = cell2.backView.backgroundColor
            p1Label.text = "Player 1 select \(cell2.pokeName.text!)"
            p1SelectedImage.image = cell2.pokeImage.image
            
        } else if collectionView == p2Collection {
            player2Poke = indexPath.row + 1
            p2Collection.isHidden = true
            p2SelectedImage.isHidden = false
            let cell3 =  p2Collection.cellForItem(at: indexPath) as! PokemonCell
            p2LabelView.backgroundColor = cell3.backView.backgroundColor
            p2Label.text = "Player 2 select \(cell3.pokeName.text!)"
            p2SelectedImage.image = cell3.pokeImage.image
            
        }
        /// Show button
        if p2Label.text != "Player 2 pokemon" && p1Label.text != "Player 1 pokemon" {
            titleLabel.text = "To fight!"
            actionButton.isHidden = false
            actionButton.tintColor = .systemYellow
            actionButton.setTitle("To fight!!", 
                                  for: .normal)
        }
    }
}
