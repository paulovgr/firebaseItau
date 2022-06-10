//
//  MainCoordinator.swift
//  firebaseItau
//
//  Created by Paulo Victor Guimaraes Rosa on 08/06/22.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController
    
    // MARK: - Life Cycle

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: -  Methods
    
    func start() {
        let initialViewController = InitialViewController()
        initialViewController.coordinator = self
        navigationController.pushViewController(initialViewController, animated: false)
    }
}
