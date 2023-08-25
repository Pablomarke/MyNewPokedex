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
}


