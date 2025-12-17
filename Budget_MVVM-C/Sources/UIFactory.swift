//
//  UIFactory.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 31.10.2025.
//
import UIKit

final class UIFactory {
    func makeButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.backgroundColor = #colorLiteral(red: 0.992937386, green: 0.194332242, blue: 0.4676690102, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }
}
