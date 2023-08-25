//
//  PokemonApi.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import Foundation
import Alamofire

class PokemonApi {
    
    // MARK: Constants
    private let BaseUrl:String = "https://pokeapi.co/api/v2/"
    static let shared = PokemonApi()
    private let statusOk = 200...299
    
    
    // MARK: Functions
    
    // Pokemon by ID
    func getPokemonId(id: Int,
                      success: @escaping (_ pokemon: Pokemon) -> (),
                      failure: @escaping(_ error: Error?) -> ()) {
        let idUrl = BaseUrl + "pokemon/\(id)/"
        AF.request(idUrl, method: .get).validate(statusCode: statusOk).responseDecodable(of: Pokemon.self) { response in
            if let pokemon = response.value {
                success(pokemon)
            } else {
                failure(response.error)
            }
        }
    }
    
    
}
