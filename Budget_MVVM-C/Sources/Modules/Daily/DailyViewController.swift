//
//  CustomNavView.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 10.11.2025.
//

import UIKit
import SnapKit

final class DailyViewController: UIViewController {
    
    private var viewModel = DailyViewModel()
    private var transactionsViewModel = TransactionsViewModel()
    
    // MARK: - Outlets
    
    private let collapsibleView: DailyHeaderView
    private let tableView = UITableView()
    private let overlayView = UIView()
    
    private var isExpanded = false
    private var selectedDate: Int = 3
    private var transactions: [TransactionModel] = []
    
    private let collapsedHeight: CGFloat = UIScreen.main.bounds.height * 0.25
    private let expandedHeight: CGFloat = UIScreen.main.bounds.height * 0.5
    private var heightConstraint: NSLayoutConstraint!
    
    // MARK: - Initialization
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.collapsibleView = DailyHeaderView(viewModel: viewModel)
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        setupView()
        loadTransactions(for: selectedDate)
        setupDelegates()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
        view.addSubview(overlayView)
        view.addSubview(collapsibleView)
    }
    
    private func setupConstraints() {
        collapsibleView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        heightConstraint = collapsibleView.heightAnchor.constraint(equalToConstant: collapsedHeight)
        heightConstraint.isActive = true
        
        overlayView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(overlayView.snp.top).inset(300)
            make.left.right.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    private func setupView() {
        tableView.backgroundColor = .systemBackground
        tableView.clipsToBounds = true
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "TransactionCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        overlayView.backgroundColor = UIColor.black.withAlphaComponent(0)
        overlayView.alpha = 0
    }
    
    private func setupDelegates() {
        collapsibleView.delegate = self
    }
    
    // MARK: - Actions
    
    private func loadTransactions(for date: Int) {
        transactions = transactionsViewModel.dayTransactions(for: date)
        tableView.reloadData()
    }
    
    @objc private func toggleExpansion() {
        isExpanded.toggle()
        
        // Анимация изменения высоты
        
        UIView.animate(withDuration: 0.3) {
            self.heightConstraint.constant = self.isExpanded ? self.expandedHeight : self.collapsedHeight
            
            self.overlayView.alpha = self.isExpanded ? 0.5 : 0
            self.overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - Extensions

extension DailyViewController: DailyHeaderViewDelegate {
    func didSelectDate(_ headerView: DailyHeaderView, date: Int) {
        selectedDate = date
        loadTransactions(for: selectedDate)
    }
    
    func didToggleExpanded(_ headerView: DailyHeaderView) {
        toggleExpansion()
    }
}

extension DailyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as? TransactionCell else { return UITableViewCell()}
        cell.configure(with: transactions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
