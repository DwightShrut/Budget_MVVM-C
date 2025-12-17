//
//  Onboarding1.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 24.10.2025.
//

import UIKit
import SnapKit

final class OnboardingPage: UIViewController {
    
    // MARK: - Outlets
    
    private var viewModel: OnboardingPageViewModel
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.2
        view.layer.cornerRadius = 20
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionTitle: UILabel = {
        let descriptionTitle = UILabel()
        descriptionTitle.textAlignment = .center
        descriptionTitle.font = .systemFont(ofSize: 17, weight: .regular)
        descriptionTitle.textColor = .secondaryLabel
        descriptionTitle.numberOfLines = 0
        return descriptionTitle
    }()
    
    private lazy var lableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 50
        return stackView
    }()
    
    // MARK: - Initializers
    
    init(viewModel: OnboardingPageViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        configure()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(imageView)
        lableStackView.addArrangedSubview(label)
        lableStackView.addArrangedSubview(descriptionTitle)
        mainStackView.addArrangedSubview(lableStackView)
        titleView.addSubview(mainStackView)
        view.addSubview(titleView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(150)
        }
        
        mainStackView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        titleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(70)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(250)
            make.width.equalTo(350)
        }
    }
    
    func configure() {
        imageView.image = viewModel.image
        label.text = viewModel.title
        descriptionTitle.text = viewModel.description
    }
}
