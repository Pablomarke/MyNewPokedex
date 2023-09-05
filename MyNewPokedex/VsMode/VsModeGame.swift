//
//  VsModeGame.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 27/8/23.
//

import Foundation

// MARK: Class to use pokemon
class Player {
    var data: Pokemon
    var hp: Int
    var atk: Int
    var def:Int
    
    init(data: Pokemon, hp: Int, atk: Int, def: Int) {
        self.data = data
        self.hp = data.stats[0].base_stat
        self.atk = data.stats[1].base_stat
        self.def = data.stats[2].base_stat
    }
}

// MARK: Class for play
class VsModeGame {
    let player1: Player
    let player2: Player
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    func atack(p1: Player, p2: Player) -> Int {
        let def = Float(p2.def) * 0.6
        let damage = p1.atk - Int(def)
        let realDamage = p2.hp - damage
        return realDamage
    }
}
