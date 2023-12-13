//
//  VsModeGame.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 27/8/23.
//

import Foundation

// MARK: for play
struct VsModeGame {
    let player1: Player
    let player2: Player
    
    func atack(p1: Player, 
               p2: Player) -> Int {
        let def = Float(p2.def) * 0.6
        let damage = p1.atk - Int(def)
        let realDamage = p2.hp - damage
        return realDamage
    }
}
