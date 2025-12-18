//
//  CustomTabBarController.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 07.11.2025.
//

import UIKit

final class CustomTabBarController: UITabBarController {
    
    private var customTabBar: CustomTabBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTabBar()
    }
    
    private func setupCustomTabBar() {
        tabBar.isHidden = true
        
        let customTabBar = CustomTabBar(frame: CGRect(
            x: 0,
            y: view.bounds.height - 80,
            width: view.bounds.width,
            height: 80
        ))
        customTabBar.delegate = self
        self.customTabBar = customTabBar
        view.addSubview(customTabBar)
    }
    
    private func updateIndex(_ index: Int) {
        customTabBar?.setIndex(index: index)
    }
}

extension CustomTabBarController: CustomTabBarDelegate {
    func didSelectItem(at index: Int) {
        selectedIndex = index
        updateIndex(index)
    }
}
