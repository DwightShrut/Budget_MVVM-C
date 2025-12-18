//
//  TransactionCell.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 09.12.2025.
//
import UIKit

class TransactionCell: UITableViewCell {
    
    // MARK: - Outlets
    
    private let titleLabel = UILabel()
    private let amountLabel = UILabel()
    private let iconView = UIView()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupConstraints()
        setupTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) not supported")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(iconView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(amountLabel)
    }
    
    private func setupConstraints() {
        iconView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconView.snp.right).offset(12)
            make.top.equalToSuperview().inset(25)
            make.right.lessThanOrEqualToSuperview().inset(20)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.centerY.equalTo(titleLabel)
        }
    }
    
    private func setupTable() {
        iconView.layer.cornerRadius = 10
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        amountLabel.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    // MARK: - Public methods
    
    func configure(with transaction: TransactionModel) {
        titleLabel.text = transaction.title
        
        let amountText = String(format: "%.2f ₽", abs(transaction.ammount))
        amountLabel.text = transaction.isIncome ? "+ \(amountText)" : "- \(amountText)"
        amountLabel.textColor = transaction.isIncome ? .systemGreen : .systemRed
        
        iconView.backgroundColor = transaction.isIncome ? .systemGreen : .systemRed
    }
}
