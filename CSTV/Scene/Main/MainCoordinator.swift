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
        let listOfMatchesViewModel = DefaultListOfMatchesViewModel(coordinator: self)
        listOfMatchesViewController.bind(to: listOfMatchesViewModel)
        self.rootViewController.isNavigationBarHidden = true
        self.rootViewController.modalPresentationStyle = .fullScreen
        self.rootViewController.viewControllers = [listOfMatchesViewController]
    }
    
    func goBackListOfMatches() {
        self.rootViewController.popViewController(animated: true)
    }
    
    func goToMatchesDetails(match: Matches) {
        
    }
}
