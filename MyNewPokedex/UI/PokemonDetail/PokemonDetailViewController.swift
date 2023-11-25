//
//  PokemonDetailViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 23/8/23.
//

import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var initView: UIView!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeNumber: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var type1View: UIView!
    @IBOutlet weak var type1Label: UILabel!
    @IBOutlet weak var type2View: UIView!
    @IBOutlet weak var type2Label: UILabel!
    @IBOutlet weak var aboutView: AboutView!
    @IBOutlet weak var detailStack: UIStackView!
    @IBOutlet weak var detailTable: UITableView!
    @IBOutlet weak var segmentedC: UISegmentedControl!
    
    // MARK: Constants
    let model: Pokemon
    
    init(model: Pokemon) {
        self.model = model
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initView.backgroundColor = model.pokeColor()
        self.view.backgroundColor = model.pokeColor()
        showTypes()
        pokeImageShow()

        type1View.myCorner()
        type2View.myCorner()
        type2Label.textColor = LETTERCOLOR
        type1Label.textColor = LETTERCOLOR
        pokeName.textColor = LETTERCOLOR
        pokeName.textColor = LETTERCOLOR
        pokeNumber.textColor = LETTERCOLOR
        
        
        pokeName.text = model.name.firstUpper()
        let numId = String(model.id).left(total: 3,
                                          cadena: "0")
        pokeNumber.text = "#\(numId)"
        bottomView.layer.cornerRadius = 40
        
        /// Segmented
        segmentedC.setTitle("About", 
                            forSegmentAt: 0)
        segmentedC.setTitle("Base Stats", 
                            forSegmentAt: 1)
        segmentedC.setTitle("Moves", 
                            forSegmentAt: 2)
        segmentedC.selectedSegmentTintColor = model.pokeColor()
        
        /// Table
        detailTable.dataSource = self
        detailTable.register(UINib(nibName: "StatsCell",
                                   bundle: nil),
                             forCellReuseIdentifier: "sCell")
        
        aboutView.baseExpData.text = String(model.base_experience)
        aboutView.heightData.text = String(model.height)
        aboutView.weightData.text = String(model.weight)
        //TODO
        aboutView.AbilitiesData.text = String(model.abilities.count)
    }
    
    @IBAction func segmentSelect(_ sender: Any) {
        
        if segmentedC.selectedSegmentIndex == 0 {
            aboutView.isHidden = false
            detailTable.isHidden = true
            
        } else if segmentedC.selectedSegmentIndex == 1 {
            aboutView.isHidden = true
            detailTable.isHidden = false
            detailTable.reloadData()
            
        } else if segmentedC.selectedSegmentIndex == 2 {
            //moves
            detailTable.isHidden = false
            aboutView.isHidden = true
            detailTable.reloadData()
            
        }
    }
}

// MARK: TableView datasource
extension PokemonDetailViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if segmentedC.selectedSegmentIndex == 1 {
            return model.stats.count
        } else if segmentedC.selectedSegmentIndex == 2 {
            return model.moves.count
        } else {
            return 0
        }
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let statCell = detailTable.dequeueReusableCell(withIdentifier: "sCell",
                                                       for: indexPath) as! StatsCell
        let moveCell = UITableViewCell(style: .value1,
                                       reuseIdentifier: "mCell")
        
        if segmentedC.selectedSegmentIndex == 1 {
            statCell.statLabel.text = model.stats[indexPath.row].stat.name.firstUpper()
            statCell.reduceText()
            let statNumber = model.stats[indexPath.row].base_stat
            statCell.numberLabel.text = String(statNumber)
            statCell.statProgress(number: statNumber)
            return statCell
        } else if segmentedC.selectedSegmentIndex == 2 {
            moveCell.textLabel?.text = model.moves[indexPath.row].move.name.firstUpper()
            return moveCell
        }
        return moveCell
    }
}

extension PokemonDetailViewController {
    
    func showTypes() {
        type1Label.text = model.types?[0].type?.name
        if model.types?.count == 2 {
            type2Label.text = model.types?[1].type?.name
        } else {
            type2Label.isHidden = true
            type2View.isHidden = true
        }
    }
    
    func pokeImageShow() {
        let imageUrl = URL(string: model.sprites!.other.officialArtwork.front_default)
        pokemonImage.kf.setImage(with: imageUrl)
        pokemonImage.contentMode = .scaleAspectFit
    }
}
