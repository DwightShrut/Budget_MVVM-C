//
//  DailyView.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 11.12.2025.
//

import UIKit
import SnapKit

protocol DailyHeaderViewDelegate: AnyObject {
    func didSelectDate(_ headerView: DailyHeaderView, date: Int)
    func didToggleExpanded(_ headerView: DailyHeaderView)
}

final class DailyHeaderView: UIView {
    
    // MARK: - Outlets
    
    var viewModel: DailyViewModel {
        didSet {
            setupView()
        }
    }
    
    var selectedDate: Int = 3 {
        didSet {
            updateDateButtons()
        }
    }
    
    var delegate: DailyHeaderViewDelegate?
    
    private let label = UILabel()
    private var rightButton = UIButton()
    private var days = UIStackView()
    private var dates = UIStackView()
    
    // MARK: - Initialization
    
    init(viewModel: DailyViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        setupHierarchy()
        setupConstraints()
        addTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(label)
        addSubview(rightButton)
        addSubview(days)
        addSubview(dates)
    }
    
    private func setupConstraints() {
        
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.left.equalToSuperview().inset(20)
        }
        
        rightButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(70)
            make.right.equalToSuperview().inset(20)
        }
        
        days.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(12)
            make.width.equalToSuperview()
        }
        
        dates.snp.makeConstraints { make in
            make.top.equalTo(days.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(20)
            make.width.equalToSuperview()
        }
    }
    
    private func setupView() {
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.2
        layer.cornerRadius = 12
        
        label.text = viewModel.title
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        rightButton.setImage(viewModel.rightButtonImage, for: .normal)
        rightButton.tintColor = .black
        
        days.distribution = .fillProportionally
        days.spacing = 5
        dates.distribution = .fillProportionally
        dates.spacing = 30
        
        setupCalendar()
    }
    
    private func setupCalendar() {
        for i in viewModel.daysArray {
            let label = UILabel()
            label.text = "\(i)"
            label.font = .systemFont(ofSize: 14)
            label.textAlignment = .center
            days.addArrangedSubview(label)
        }
        
        for i in viewModel.dateArray {
            let button = UIButton(type: .system)
            button.tintColor = .black
            button.backgroundColor = Int(i) == selectedDate ? #colorLiteral(red: 0.992937386, green: 0.194332242, blue: 0.4676690102, alpha: 1) : .lightGray
            button.setTitle("\(i)", for: .normal)
            button.layer.cornerRadius = 10
            button.tag = Int(i) ?? 0
            button.addAction(UIAction { [weak self] _ in
                self?.dateButtonTapped(button) }, for: .touchUpInside)
            dates.addArrangedSubview(button)
        }
    }
    
    // MARK: - Private methods
    
    private func dateButtonTapped(_ button: UIButton) {
        selectedDate = button.tag
        delegate?.didSelectDate(self, date: button.tag)
    }
    
    private func updateDateButtons() {
        for subview in dates.arrangedSubviews {
            guard let button = subview as? UIButton else { continue }
            button.backgroundColor = button.tag == selectedDate ? #colorLiteral(red: 0.992937386, green: 0.194332242, blue: 0.4676690102, alpha: 1) : .lightGray
        }
    }
    
    private func addTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true
    }
    
    @objc private func handleTap() {
        delegate?.didToggleExpanded(self)
    }
}
