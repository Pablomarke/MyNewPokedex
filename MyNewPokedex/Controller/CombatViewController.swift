//
//  CombatViewController.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 27/8/23.
//

import UIKit
import Kingfisher

class CombatViewController: UIViewController {
    
    @IBOutlet weak var p1atk: UIButton!
    @IBOutlet weak var p2atk: UIButton!
    
    @IBOutlet weak var player2Dataview: CombatDataView!
    @IBOutlet weak var player1DataView: CombatDataView!
    
    @IBOutlet weak var p2ViewIamge: UIView!
    @IBOutlet weak var p2Image: UIImageView!
    @IBOutlet weak var p1ViewImage: UIView!
    @IBOutlet weak var p1Image: UIImageView!
    @IBOutlet weak var menuStack: UIStackView!
    
    @IBOutlet weak var simulatorLabel: UILabel!
    @IBOutlet weak var tableAtacks: UITableView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var viewLabel: UILabel!
    
    
    var p1: Player
    var p2: Player
    var combat: VsModeGame
    
    init(p1: Player, p2: Player, combat: VsModeGame ) {
        self.p1 = p1
        self.p2 = p2
        self.combat = combat
        
        super.init(nibName: nil,
                   bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simulatorLabel.textColor = .systemYellow
        simulatorLabel.layer.cornerRadius = 24
       
        player2Dataview.syncViewPlayer(player: p2)
        p2Image.kf.setImage(with: URL(string: p2.data.sprites!.front_default))
        player1DataView.syncViewPlayer(player: p1)
        p1Image.kf.setImage(with: URL(string: p1.data.sprites!.back_default))
        p2ViewIamge.layer.cornerRadius = 50
        p1ViewImage.backgroundColor = .clear
    
        p1ViewImage.layer.cornerRadius = 50
        p2ViewIamge.backgroundColor = .clear
        
        menuStack.backgroundColor = .clear
        viewLabel.text = "¿Qué quieres hacer?"
        viewLabel.numberOfLines = 3
        p1atk.setTitle("Atk. normal", for: .normal)
        p1atk.tintColor = p1.data.pokeColor()
        p2atk.setTitle("Atk. normal", for: .normal)
        p2atk.tintColor = p2.data.pokeColor()
        view1.backgroundColor = .black
        view1.layer.cornerRadius = 12
        view2.backgroundColor = .systemYellow
        view2.layer.cornerRadius = 12
        view3.backgroundColor = .darkGray
        view3.layer.cornerRadius = 12
        
        tableAtacks.dataSource = self
        tableAtacks.delegate = self
        tableAtacks.backgroundColor = UIColor.clear
                tableAtacks.backgroundView = UIView.init(frame: CGRect.zero)
    }


    @IBAction func p1atkAct(_ sender: Any) {
        p2.hp = self.combat.atack(p1: p1, p2: p2)
        player2Dataview.syncViewPlayer(player: p2)
        if p2.hp <= 0 {
            p2Image.isHidden = true
        }
    }
    
    @IBAction func p2atkAct(_ sender: Any) {
        p1.hp = self.combat.atack(p1: p2, p2: p1)
        player1DataView.syncViewPlayer(player: p1)
        if p1.hp <= 0{
            p1Image.isHidden = true
        }
    }
}

extension CombatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return p1.data.abilities.count + p1.data.moves.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "ABICell")
        cell.backgroundColor = p1.data.pokeColor()
            if indexPath.row <= (p1.data.abilities.count - 1) {
                cell.textLabel?.text = p1.data.abilities[indexPath.row].ability.name
            } else if indexPath.row >= (p1.data.abilities.count - 1) && indexPath.row <= (p1.data.abilities.count + p1.data.moves.count) - 3 {
                cell.textLabel?.text = p1.data.moves[indexPath.row].move.name
            }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        p2.hp = self.combat.atack(p1: p1, p2: p2)
        player2Dataview.syncViewPlayer(player: p2)
        if p2.hp <= 0 {
            p2Image.isHidden = true
        }
    }
    
}
