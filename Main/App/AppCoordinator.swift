//
//  AppCoordinator.swift
//  Main
//
//  Created by Özgün Ergen on 30.04.2022.
//

import Foundation
import UIKit

class AppCoordinator {
    private let dependency: DependencyContainer

    // MARK: - Init

    init(dependency: DependencyContainer) {
        self.dependency = dependency
    }

}


extension AppCoordinator {
    
    func start() {
        
        let photos = PhotosViewController.instantiateViewController()
        var navigation = UINavigationController(rootViewController: photos)
        dependency.window.rootViewController = navigation
    }
    
}
