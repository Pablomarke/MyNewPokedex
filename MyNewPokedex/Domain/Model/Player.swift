//
//  Player.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 13/12/23.
//

import Foundation

// MARK: Class to use pokemon
class Player {
    var data: Pokemon
    var hp: Int
    var atk: Int
    var def:Int
    
    init(data: Pokemon,
         hp: Int,
         atk: Int,
         def: Int) {
        self.data = data
        self.hp = data.stats[0].base_stat
        self.atk = data.stats[1].base_stat
        self.def = data.stats[2].base_stat
    }
}
