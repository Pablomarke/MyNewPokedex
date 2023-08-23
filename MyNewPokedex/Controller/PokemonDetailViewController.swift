//
//  PokemonDetailViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 23/8/23.
//

import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var initView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeNumber: UILabel!
    
    var model: Pokemon
    
    init(model: Pokemon) {
        self.model = model
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imageUrl = URL(string: model.sprites!.other.officialArtwork.front_default)
        pokemonImage.kf.setImage(with: imageUrl)
        
        pokeName.text = model.name.firstUpper()
        pokeNumber.text = "#\(String(model.id))"

        
    }


}
