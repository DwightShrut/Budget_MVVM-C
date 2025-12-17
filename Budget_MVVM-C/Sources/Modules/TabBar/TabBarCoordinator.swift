//
//  TabBarCoordinator.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 07.11.2025.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = CustomTabBarController()
        let dailyNavigationController = DailyViewController()
        
        // Заглушки для будущих модулей
        
        let vc2 = StatViewController()
        vc2.tabBarItem = UITabBarItem(title: "Stat", image: nil, tag: 1)
        
        let vc3 = BudgetViewController()
        vc3.tabBarItem = UITabBarItem(title: "Budget", image: nil, tag: 2)
        
        let vc4 = ProfileViewController()
        vc4.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 3)
        
        tabBarController.viewControllers = [
            dailyNavigationController,
            vc2,
            vc3,
            vc4
        ]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
