//
//  PokemonCell.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 22/8/23.
//

import UIKit
import Kingfisher

class PokemonCell: UICollectionViewCell {
    // MARK: Outlets
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
        pokeName.myLetter()
        cellStyle()
    }
    
    // MARK: cofigure the cell
    func configure(whit pokemon: Pokemon){
        pokeName.text = pokemon.name.firstUpper()
        backView.backgroundColor = pokemon.pokeColor()
        typeLabel.text = pokemon.types?.first?.type?.name
        
        let myurl = URL(string: pokemon.sprites!.other.officialArtwork.front_default)
        pokeImage.kf.setImage(with: myurl)
       
        if pokemon.types?.count == 2 {
            type2Label.text = pokemon.types?.first?.type?.name
        } else {
            type2Label.isHidden = true
            type2View.isHidden = true
        }
    }
    
    func cellStyle () {
        backView.myCorner(corner: 22)
        filterView.myCorner(corner: 22)
        typeView.myCorner()
        type2View.myCorner()
        filterView.backgroundColor = BCOLOR
        typeLabel.textColor = LETTERCOLOR
        type2Label.textColor = LETTERCOLOR
    }
}
