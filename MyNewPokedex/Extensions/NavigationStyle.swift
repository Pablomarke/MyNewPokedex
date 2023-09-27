//
//  NavigationStyle.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 3/9/23.
//

import Foundation
import UIKit

func navigationStyle(nav: UINavigationController) {
    let backButton = UIBarButtonItem()
    backButton.title = ""
    backButton.tintColor = .black
    nav.navigationBar.topItem?.backBarButtonItem = backButton
}
