//
//  PokemonApi.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import Foundation

class PokemonApi {
    
    // MARK: Constants
    static let shared = PokemonApi()
    
    enum Status {
        static let ok = 200
    }
    
    enum Endpoint {
        static let baseUrl = "https://pokeapi.co/api/v2/"
        static let pokemon = "pokemon/"
    }
    
    enum HttpMethod {
        static let get = "GET"
    }
    
    // MARK: Functions
    /// Pokemon by ID
    func getPokemonId(id: Int,  
                      completion: @escaping (Pokemon) -> Void){
        let idUrl = Endpoint.baseUrl + Endpoint.pokemon + "\(id)/"
        guard let url = URL(string: idUrl) else {return}
        var urlRequest = URLRequest(url: url )
        urlRequest.httpMethod = HttpMethod.get
        
        URLSession.shared.dataTask(with: urlRequest) {data,response,error in
            DispatchQueue.main.async {
                guard error == nil else {
                    return
                }
                
                guard let data,
                      (response as? HTTPURLResponse)?.statusCode == Status.ok else {
                    return
                }
                
                guard let pokemon = try? JSONDecoder().decode(Pokemon.self,
                                                              from: data) else {
                    return
                }
                
                completion(pokemon)
            }
        }.resume()
    }
}
