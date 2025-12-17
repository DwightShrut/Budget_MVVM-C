//
//  Untitled.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 06.11.2025.
//

import UIKit
import SnapKit

protocol CustomTabBarDelegate: AnyObject {
    func didSelectItem(at index: Int)
}

final class CustomTabBar: UIView {
    
    // MARK: - Outlets
    
    var delegate: CustomTabBarDelegate?
    
    private let itemCount = 4
    private var items: [UIButton] = []
    private var stack = UIStackView()
    private var leftStack = UIStackView()
    private var rightStack = UIStackView()
    private let addButton = UIButton()
    private var selectedIndex: Int = 0
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setupView() {
        backgroundColor = .systemBackground
        
        leftStack.axis = .horizontal
        leftStack.alignment = .fill
        leftStack.distribution = .fillEqually
        leftStack.spacing = 5
        
        rightStack.axis = .horizontal
        rightStack.alignment = .fill
        rightStack.distribution = .fillEqually
        rightStack.spacing = 5
        
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 60
        stack.addArrangedSubview(leftStack)
        stack.addArrangedSubview(rightStack)
        addSubview(stack)
        
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .light)
        addButton.backgroundColor = #colorLiteral(red: 0.992937386, green: 0.194332242, blue: 0.4676690102, alpha: 1)
        addButton.layer.cornerRadius = 60 / 2
        addSubview(addButton)
        
    }
    
    private func setupLayout() {
        stack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(56)
            make.width.equalToSuperview().inset(8)
        }
        
        addButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(stack.snp.bottom).inset(20)
            make.width.height.equalTo(60)
        }
    }
    
    // MARK: - Actions
    
    func moduleTapped(at button: UIButton) {
        delegate?.didSelectItem(at: button.tag)
    }
    
    func setIndex(index: Int) {
        guard index >= 0 && index < itemCount else { return }
        selectedIndex = index
        
        for (i, button) in items.enumerated() {
            button.isSelected = (i == index)
        }
    }
    
    func configureButton() {
        for i in 0..<itemCount {
            let button = UIButton()
            button.tag = i
            button.addAction(UIAction { [weak self] _ in
                self?.moduleTapped(at: button) }, for: .touchUpInside)
            
            switch i {
            case 0:
                button.setImage(UIImage(named: "tabIcon_1"), for: .normal)
                button.setImage(UIImage(named: "tabIcon_1")?.withTintColor(#colorLiteral(red: 0.992937386, green: 0.194332242, blue: 0.4676690102, alpha: 1)), for: .selected)
                leftStack.addArrangedSubview(button)
            case 1:
                button.setImage(UIImage(named: "tabIcon_2"), for: .normal)
                button.setImage(UIImage(named: "tabIcon_2_filled"), for: .selected)
                leftStack.addArrangedSubview(button)
            case 2:
                button.setImage(UIImage(named: "tabIcon_3"), for: .normal)
                button.setImage(UIImage(named: "tabIcon_3_filled"), for: .selected)
                rightStack.addArrangedSubview(button)
            case 3:
                button.setImage(UIImage(named: "tabIcon_4"), for: .normal)
                button.setImage(UIImage(named: "tabIcon_4_filled"), for: .selected)
                rightStack.addArrangedSubview(button)
            default:
                break
            }
            
            items.append(button)
        }
        setIndex(index: 0)
    }
}
