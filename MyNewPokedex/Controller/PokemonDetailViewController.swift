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
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var type1View: UIView!
    @IBOutlet weak var type1Label: UILabel!
    
    @IBOutlet weak var type2View: UIView!
    @IBOutlet weak var type2Label: UILabel!
    
    
    
    @IBOutlet weak var detailStack: UIStackView!
    @IBOutlet weak var detailTable: UITableView!
    ///buttons
    
    @IBOutlet weak var segmentedC: UISegmentedControl!
    
    
    var model: Pokemon
    
    init(model: Pokemon) {
        self.model = model
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView.backgroundColor = model.pokeColor()
        self.view.backgroundColor = model.pokeColor()
        
        self.navigationController?.navigationBar.tintColor = .white
        
        let imageUrl = URL(string: model.sprites!.other.officialArtwork.front_default)
        pokemonImage.kf.setImage(with: imageUrl)
        pokemonImage.contentMode = .scaleAspectFit
        
        type1Label.text = model.types?[0].type?.name
        if model.types?.count == 2 {
            type2Label.text = model.types?[1].type?.name
        } else {
            type2Label.isHidden = true
            type2View.isHidden = true
        }
        type1View.layer.cornerRadius = 11
        type1View.backgroundColor = UIColor(white: 1, alpha: 0.33)
        type1Label.textColor = .white
        
        type2View.layer.cornerRadius = 11
        type2View.backgroundColor = UIColor(white: 1, alpha: 0.33)
        type2Label.textColor = .white
        
        pokeName.text = model.name.firstUpper()
        pokeName.textColor = .white
        
        pokeNumber.text = "#\(String(model.id))"
        pokeNumber.textColor = .white
        bottomView.layer.cornerRadius = 40
        
        /// Segmented
        segmentedC.backgroundColor = .white
        segmentedC.setTitle("About", forSegmentAt: 0)
        segmentedC.setTitle("Base Stats", forSegmentAt: 1)
        segmentedC.setTitle("Evolution", forSegmentAt: 2)
        segmentedC.setTitle("Moves", forSegmentAt: 3)
        
        /// Table
        detailTable.dataSource = self
        detailTable.register(UINib(nibName: "StatsCell",
                                   bundle: nil),
                             forCellReuseIdentifier: "sCell")
        
    }
    
    @IBAction func segmentSelect(_ sender: Any) {
        if segmentedC.selectedSegmentIndex == 0 {
            segmentedC.backgroundColor = .red
        } else if segmentedC.selectedSegmentIndex == 1 {
            segmentedC.backgroundColor = .blue
        } else if segmentedC.selectedSegmentIndex == 2 {
            segmentedC.backgroundColor = .cyan
        } else if segmentedC.selectedSegmentIndex == 3 {
            segmentedC.backgroundColor = .brown
        }
    }
}
extension PokemonDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return model.stats.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statCell = detailTable.dequeueReusableCell(withIdentifier: "sCell",
                                                       for: indexPath) as! StatsCell
        statCell.statLabel.text = model.stats[indexPath.row].stat.name.firstUpper()
        statCell.reduceText()
        let statNumber = model.stats[indexPath.row].base_stat
        statCell.numberLabel.text = String(statNumber)
        statCell.statProgress(number: statNumber)
        return statCell
    }
}
