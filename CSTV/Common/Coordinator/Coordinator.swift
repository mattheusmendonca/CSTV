//
//  Coordinator.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    /// Closure that must be invoked whenever the coordinator ends its flow to notify
    /// the parent coordinator to free the current child coordinator.
    var isCompleted: (() -> Void)? { get set }

    func start()
}

extension Coordinator {
    func start(coordinator: Coordinator) {
        coordinator.isCompleted = { [weak self, weak coordinator] in
            if let coordinator = coordinator {
                self?.free(coordinator: coordinator)
            }
        }

        self.childCoordinators.append(coordinator)
        coordinator.start()
    }

    func free(coordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
    
    func freeAllChildCoordinatorsWith<T>(type: T.Type) {
        self.childCoordinators = self.childCoordinators.filter { $0 is T == false }
    }
    
    func freeAllChildCoordinators() {
        self.childCoordinators.removeAll()
    }
}

protocol NavigationCoordinator: Coordinator {
    var rootViewController: UINavigationController { get }
}
