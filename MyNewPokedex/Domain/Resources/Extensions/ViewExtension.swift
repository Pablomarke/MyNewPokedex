//
//  CellStyle.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 26/9/23.
//

import UIKit

extension UIView {
    func myCorner(corner: Int = 11) {
        layer.cornerRadius = CGFloat(corner)
        backgroundColor = BCOLOR
    }
}
