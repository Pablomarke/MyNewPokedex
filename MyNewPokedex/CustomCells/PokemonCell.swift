//
//  PokemonCell.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 22/8/23.
//

import UIKit
import Kingfisher

class PokemonCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!

    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var type2View: UIView!
    @IBOutlet weak var type2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokeName.textColor = .white
        
        pokeName.font = .boldSystemFont(ofSize: 16)
        backView.layer.cornerRadius = 22
        filterView.backgroundColor = UIColor(white: 1, alpha: 0.25)
        filterView.layer.cornerRadius = 22
        typeView.layer.cornerRadius = 11
        typeView.backgroundColor = UIColor(white: 1, alpha: 0.33)
        typeLabel.textColor = .white
        
        type2View.layer.cornerRadius = 11
        type2View.backgroundColor = UIColor(white: 1, alpha: 0.33)
        type2Label.textColor = .white
    }

    func configure(whit pokemon: Pokemon){
        pokeName.text = pokemon.name.firstUpper()
        backView.backgroundColor = pokemon.pokeColor()
        let myurl = URL(string: pokemon.sprites!.other.officialArtwork.front_default)
        pokeImage.kf.setImage(with: myurl)
        typeLabel.text = pokemon.types?[0].type?.name
        if pokemon.types?.count == 2 {
        type2Label.text = pokemon.types?[1].type?.name
        } else {
            type2Label.isHidden = true
            type2View.isHidden = true
        }
    }
}
