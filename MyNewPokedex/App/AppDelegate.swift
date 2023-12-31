//
//  AppDelegate.swift
//  MyNewPokedex
//
//  Created by Pablo Márquez Marín on 21/8/23.
//

import UIKit

@main
class AppDelegate: UIResponder,
                   UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let home = HomeViewController()
        let navigation = UINavigationController(rootViewController: home)
        self.window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }
}
        
        
        
  
