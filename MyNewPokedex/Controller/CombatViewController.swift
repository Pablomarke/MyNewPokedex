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
        self.view.backgroundColor = .systemMint
        player2Dataview.syncViewPlayer(player: p2)
        p2Image.kf.setImage(with: URL(string: p2.data.sprites!.front_default))
        player1DataView.syncViewPlayer(player: p1)
        p1Image.kf.setImage(with: URL(string: p1.data.sprites!.back_default))
        p2ViewIamge.layer.cornerRadius = 50
        p1ViewImage.backgroundColor = .clear
    
        p1ViewImage.layer.cornerRadius = 50
        p2ViewIamge.backgroundColor = .clear
        
        menuStack.backgroundColor = .darkGray
    }


    @IBAction func p1atkAct(_ sender: Any) {
        p2.hp = self.combat.atack(p1: p1, p2: p2)
        player2Dataview.syncViewPlayer(player: p2)
    }
    
    @IBAction func p2atkAct(_ sender: Any) {
        p1.hp = self.combat.atack(p1: p2, p2: p1)
        player1DataView.syncViewPlayer(player: p1)
    }
}

extension CombatViewController {
   
}
