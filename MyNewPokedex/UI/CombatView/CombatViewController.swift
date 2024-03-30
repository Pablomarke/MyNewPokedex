//
//  CombatViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 27/8/23.
//

import UIKit
import Kingfisher

final class CombatViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var p1atk: UIButton!
    @IBOutlet weak var p2atk: UIButton!
    @IBOutlet weak var player2Dataview: CombatDataView!
    @IBOutlet weak var player1DataView: CombatDataView!
    @IBOutlet weak var p2ViewImage: UIView!
    @IBOutlet weak var p2Image: UIImageView!
    @IBOutlet weak var p1ViewImage: UIView!
    @IBOutlet weak var p1Image: UIImageView!
    @IBOutlet weak var menuStack: UIStackView!
    @IBOutlet weak var secondStackView: UIStackView!
    @IBOutlet weak var simulatorLabel: UILabel!
    @IBOutlet weak var tableAtacks: UITableView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var viewLabel: UILabel!
    
    // MARK: - Properties -
    let p1: Player
    let p2: Player
    let combat: VsModeGame
    
    // MARK: - Init -
    init(p1: Player, 
         p2: Player,
         combat: VsModeGame) {
        self.p1 = p1
        self.p2 = p2
        self.combat = combat
        
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - lifecycke -
    override func viewDidLoad() {
        super.viewDidLoad()
        syncPokemonStyleWithView()
        createViewStyle()
        createTableAtacks()
    }
    
    // MARK: - Funciones -
    func syncPokemonStyleWithView() {
        p1atk.tintColor = p1.data.pokeColor()
        p2atk.tintColor = p2.data.pokeColor()
        player2Dataview.syncViewPlayer(player: p2)
        player1DataView.syncViewPlayer(player: p1)
        
        if let p2CombatImage = p2.data.sprites  {
            p2Image.kf.setImage(with: URL(string: p2CombatImage.front_default))
        }
        
        if let p1CombatImage = p1.data.sprites{
            p1Image.kf.setImage(with: URL(string: p1CombatImage.back_default))
        }
    }
    
    func createViewStyle() {
        if let navi = self.navigationController{
            navigationStyle(nav: navi)
        }
        
        simulatorLabel.textColor = .systemYellow
        simulatorLabel.layer.cornerRadius = 24
        p2ViewImage.layer.cornerRadius = 50
        p1ViewImage.backgroundColor = .clear
        p1ViewImage.layer.cornerRadius = 50
        p2ViewImage.backgroundColor = .clear
        secondStackView.backgroundColor = .clear
        menuStack.backgroundColor = .clear
        viewLabel.text = "¿Qué quieres hacer?"
        viewLabel.numberOfLines = 3
        p1atk.setTitle("Atk. normal", 
                       for: .normal)
        p2atk.setTitle("Atk. normal", 
                       for: .normal)
        view1.backgroundColor = .black
        view1.layer.cornerRadius = 12
        view2.backgroundColor = .systemYellow
        view2.layer.cornerRadius = 12
        view3.backgroundColor = .darkGray
        view3.layer.cornerRadius = 12
    }
    
    func createTableAtacks() {
        tableAtacks.dataSource = self
        tableAtacks.delegate = self
        tableAtacks.backgroundColor = UIColor.clear
        tableAtacks.backgroundView = UIView.init(frame: CGRect.zero)
    }
    
    func player1Atack(){
        p2.hp = self.combat.atack(p1: p1, 
                                  p2: p2)
        player2Dataview.syncViewPlayer(player: p2)
        pokemonIsDead(player: p2,
                      image: p2Image)
    }
    
    func player2Atack(){
        p1.hp = self.combat.atack(p1: p2, 
                                  p2: p1)
        player1DataView.syncViewPlayer(player: p1)
        pokemonIsDead(player: p1, 
                      image: p1Image)
    }
    
    func pokemonIsDead(player: Player, 
                       image: UIImageView){
        if player.hp <= 0 {
            image.image = UIImage(named: "dead")
        }
    }
    
    // MARK: Buttons atack
    @IBAction func p1atkAct(_ sender: Any) {
        player1Atack()
    }
    
    @IBAction func p2atkAct(_ sender: Any) {
        player2Atack()
    }
}

// MARK: DataSource
extension CombatViewController: UITableViewDataSource,
                                UITableViewDelegate {
    func tableView( _ tableView: UITableView,
                    numberOfRowsInSection section: Int) -> Int {
        return p1.data.abilities.count + p1.data.moves.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1,
                                   reuseIdentifier: "ABICell")
        
        cell.backgroundColor = p1.data.pokeColor()
        
        if indexPath.row <= (p1.data.abilities.count - 1) {
            cell.textLabel?.text = p1.data.abilities[indexPath.row].ability.name
        } else if indexPath.row >= (p1.data.abilities.count - 1) && indexPath.row <= (p1.data.abilities.count + p1.data.moves.count) - 3 {
            cell.textLabel?.text = p1.data.moves[indexPath.row].move.name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        p2.hp = self.combat.atack(p1: p1, 
                                  p2: p2)
        player2Dataview.syncViewPlayer(player: p2)
        pokemonIsDead(player: p2,
                      image: p2Image)
    }
}
