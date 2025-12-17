//
//  OnboardingCoordinator.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 31.10.2025.
//

import UIKit

protocol OnboardingCoordinatorProtocol: Coordinator {
    func finishOnboarding()
}

final class OnboardingCoordinator: OnboardingCoordinatorProtocol {
    weak var window: UIWindow?
    var finishOnboardingFlow: (() -> Void)?
    
    func start() {
        let onboardingVC = OnboardingViewController(coordinator: self)
        window?.rootViewController = onboardingVC
    }
    
    func finishOnboarding() {
        guard let window = self.window else { return }
        let mainController = TabBarCoordinator(window: window)
        mainController.start()
    }
}
