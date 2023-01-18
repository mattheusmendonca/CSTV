//
//  AppCoordinator.swift
//  CSTV
//
//  Created by Mac Lavid on 17/01/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var isCompleted: (() -> Void)?
    var childCoordinators = [Coordinator]()
    
    let window: UIWindow
    
    init(windowScene: UIWindowScene) {
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window.windowScene = windowScene
    }
    
    func start() {
        self.showMainRoute()
    }
    
    func showMainRoute() {
        self.freeAllChildCoordinators()
        let coordinator = MainCoordinator()
        self.start(coordinator: coordinator)
        self.window.rootViewController = coordinator.rootViewController
        self.window.makeKeyAndVisible()
    }
}
