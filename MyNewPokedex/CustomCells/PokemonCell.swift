//
//  PokemonCell.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 22/8/23.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!

    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var type2View: UIView!
    @IBOutlet weak var type2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pokeName.textColor = .white
      
        backView.layer.cornerRadius = 22
        
        typeView.layer.cornerRadius = 11
        typeView.backgroundColor = UIColor(white: 1, alpha: 0.33)
        typeLabel.textColor = .white
        
        type2View.layer.cornerRadius = 11
        type2View.backgroundColor = UIColor(white: 1, alpha: 0.33)
        type2Label.textColor = .white
    }

}
