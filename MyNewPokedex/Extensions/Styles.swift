//
//  CellStyle.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 26/9/23.
//

import Foundation
import SwiftUI

extension UILabel {
    
    func myLetter() {
        textColor = .white
        font = .boldSystemFont(ofSize: 16)
    }
}

extension UIView {
    
    func myCorner() {
        layer.cornerRadius = 11
        backgroundColor = BCOLOR
        
    }
}
