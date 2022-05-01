//
//  AppDelegate.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        Loader.initializeLoader()
        
        let dependencyContainer = DependencyContainer(window: window)
        let appCoordinator = AppCoordinator(dependency: dependencyContainer)
        appCoordinator.start()
        
        window.makeKeyAndVisible()
        
        return true
    }



}

