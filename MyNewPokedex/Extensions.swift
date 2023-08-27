//
//  Extensions.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 23/8/23.
//

import Foundation

extension String {
    
    ///  uppercassed firtst letter
    func firstUpper() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.firstUpper()
    }
    
    func left(total:Int,
              cadena: String) -> String {
    let pad = total - self.count
    return pad < 1 ? self : "".padding(toLength: pad,
                                       withPad: cadena,
                                       startingAt: 0)+self


    }
}


