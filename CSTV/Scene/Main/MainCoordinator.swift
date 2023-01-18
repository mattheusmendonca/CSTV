//
//  MainCoordinator.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation
import UIKit

class MainCoordinator: NavigationCoordinator {
    
    var isCompleted: (() -> Void)?
    var rootViewController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = UINavigationController()
    }
    
    func start() {
        let listOfMatchesViewController = ListOfMatchesViewController()
        //listOfMatchesViewController.bind(to: self.viewModel!)
        self.rootViewController.isNavigationBarHidden = true
        self.rootViewController.modalPresentationStyle = .fullScreen
        self.rootViewController.viewControllers = [listOfMatchesViewController]
    }
    
    func goBackListOfMatches() {
        self.rootViewController.popViewController(animated: true)
    }
}
