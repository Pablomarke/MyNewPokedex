//
//  PokemonApi.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import Foundation

class PokemonApi {
    
    // MARK: Constants
    private let baseUrl:String = "https://pokeapi.co/api/v2/"
    static let shared = PokemonApi()
    private let statusOk = 200...299
    
    // MARK: Functions
    
    /// Pokemon by ID
    func getPokemonId(id: Int,  completion: @escaping (Pokemon) -> Void){
        let idUrl = baseUrl + "pokemon/\(id)/"
        guard let url = URL(string: idUrl) else {return}
        var urlRequest = URLRequest(url: url )
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) {data,response,error in
            DispatchQueue.main.async {
            guard error == nil else { return }
            guard let data,
                    (response as? HTTPURLResponse)?.statusCode == 200 else {
                            return
                        }
            guard let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {return}
            
                completion(pokemon)
            }
        }.resume()
    }
}
