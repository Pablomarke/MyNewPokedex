//
//  Pokemon.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import Foundation

struct Pokemon: Codable {
    var base_experience: Int
    var height: Int
    var weight: Int
    var id: Int
    var name: String
    var types: [PokeType]?
    var sprites: Sprites?
    
    enum CodingKeys: CodingKey {
        case base_experience
        case height
        case weight
        case id
        case name
        case types
        case sprites
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
