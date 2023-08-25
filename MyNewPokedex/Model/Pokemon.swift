//
//  Pokemon.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import Foundation
import UIKit

// MARK: Pokemon Base
struct Pokemon: Codable {
    var base_experience: Int
    var height: Int
    var weight: Int
    var id: Int
    var name: String
    var types: [PokeType]?
    var sprites: Sprites?
    var stats: [Stats]
    var abilities: [SingleAbility]
    var moves: [SelfMove]
    
    enum CodingKeys: CodingKey {
        case base_experience
        case height
        case weight
        case id
        case name
        case types
        case sprites
        case stats
        case abilities
        case moves
    }
}

struct PokeType: Codable {
    var slot: Int
    var type: Type?
    
    enum CodingKeys: CodingKey {
        case slot
        case type
    }
}

struct Type: Codable {
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}

struct Stats: Codable {
    var base_stat: Int
    var effort: Int
    var stat: Stat
    
    enum CodingKeys: CodingKey {
        case base_stat
        case effort
        case stat
    }
}


// MARK: Images
struct Sprites: Codable {
    var front_default: String
    var other: Other
    
    enum CodingKeys: CodingKey {
        case front_default
        case other
    }
}

struct Other : Codable {
    var officialArtwork: OfficialArtwork
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct OfficialArtwork: Codable {
    var front_default: String
    var front_shiny: String
    
    enum CodingKeys: CodingKey {
        case front_default
        case front_shiny
    }
}

// MARK: Extensions

struct Stat: Codable {
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
}

struct SingleAbility: Codable {
    var ability: Ability
    var is_hidden: Bool
    var slot: Int
    
    enum CodingKeys: CodingKey {
        case ability
        case is_hidden
        case slot
    }
}

struct Ability: Codable {
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}


struct Moves: Codable {
    var move: SelfMove
    
    enum CodingKeys: CodingKey {
        case move
    }
}

struct SelfMove: Codable {
    var move: Move
    //TO DO: var version_group_details
   
    enum CodingKeys: CodingKey {
        case move
    }
}
struct Move: Codable {
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}

extension Pokemon {
    
    ///color background
    func pokeColor() -> UIColor {
        if self.types?[0].type?.name == "water" {
            return .systemBlue
        } else if self.types?[0].type?.name == "grass" {
            return .systemMint
        } else if self.types?[0].type?.name == "fire" {
           return .systemRed
        } else if self.types?[0].type?.name == "ground" {
            return .systemBrown
        } else if self.types?[0].type?.name == "normal" {
            return .systemGray3
        } else if self.types?[0].type?.name == "electric" {
           return .systemYellow
        } else if self.types?[0].type?.name == "bug" {
           return .systemTeal
        } else if self.types?[0].type?.name == "poison" {
           return .systemGreen
        } else if self.types?[0].type?.name == "fairy" {
           return .systemPink
        } else {
           return .black
        }
    }
}
