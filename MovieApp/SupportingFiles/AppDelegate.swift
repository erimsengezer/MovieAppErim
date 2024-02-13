//
//  AppDelegate.swift
//  MovieApp
//
//  Created by erimsengezer on 12.02.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = SplashViewController(nibName: "SplashViewController", bundle: nil)
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        
        return true
    }
}

