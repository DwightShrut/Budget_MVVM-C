//
//  TabBar.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 02.11.2025.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    var childCoordinators: [Coordinator] = []
    
    private let tabBarController = UITabBarController()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showOnboarding()
    }
    
    private func showOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator()
        onboardingCoordinator.window = window
        onboardingCoordinator.finishOnboardingFlow = { [weak self] in
            self?.showTabBar()
        }
        
        onboardingCoordinator.start()
        childCoordinators.append(onboardingCoordinator)
    }
    
    private func showTabBar() {
        let tabBarCoordinator = TabBarCoordinator(window: window)
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}
