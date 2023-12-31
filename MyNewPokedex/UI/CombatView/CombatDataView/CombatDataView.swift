//
//  CombatDataView.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 28/8/23.
//

import Foundation
import UIKit

class CombatDataView: UIView {
    
    // MARK: Outlets
    @IBOutlet weak var combatContentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hpView: UIView!
    @IBOutlet weak var progressHp: UIProgressView!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var hpNumberLabel: UILabel!
   
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: config
    private func commonInit() {
        Bundle.main.loadNibNamed("CombatDataView",
                                 owner: self,
                                 options: nil)
        addSubview(combatContentView)
        combatContentView.frame = self.bounds
        combatContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        hpLabel.text = "HP"
        hpLabel.textColor = .yellow
        combatContentView.layer.cornerRadius = 16
        hpView.layer.cornerRadius = 4
        hpView.backgroundColor = .black
        
    }
}

// MARK: Extension for sync player
extension CombatDataView {
    func syncViewPlayer(player: Player) {
        nameLabel.text = player.data.name.firstUpper()
        hpNumberLabel.text = "HP \(player.hp) / \(player.data.stats[0].base_stat)"
        progressHp.progress = Float(player.hp)/Float(player.data.stats[0].base_stat)
        colorProgress()
    }
    
    func colorProgress() {
        if progressHp.progress == 1 {
            progressHp.progressTintColor = .systemGreen
        } else if progressHp.progress >= 0.75 {
            progressHp.progressTintColor = .systemBlue
        } else if progressHp.progress >= 0.50 {
            progressHp.progressTintColor = .systemYellow
        } else if progressHp.progress >= 0.25 {
            progressHp.progressTintColor = .systemOrange
        } else if progressHp.progress <= 0 {
            hpNumberLabel.text = "K.O."
        }
    }
}
