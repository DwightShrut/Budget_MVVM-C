//
//  OnboardingViewController.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 27.10.2025.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIPageViewController {
    
    // MARK: - Outlets
    
    private var coordinator: OnboardingCoordinator?
    
    private var viewModels: [OnboardingPageViewModel] = []
    
    private var pageIndex = 0  {
        didSet {
            updatePage()
        }
    }
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.992937386, green: 0.194332242, blue: 0.4676690102, alpha: 1)
        pageControl.pageIndicatorTintColor = .lightGray
        return pageControl
    }()
    
    private lazy var nextButton = UIFactory().makeButton(title: "Дальше")
    private lazy var skipButton = UIFactory().makeButton(title: "Пропустить")
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 100
        stack.distribution = .fillEqually
        return stack
    }()
    
    // MARK: - Initializers
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        super.init(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageViewController()
        setupHierarchy()
        setupUI()
        setupLayout()
        updatePage()
    }
    
    // MARK: - Setup
    
    private func setupPageViewController() {
        dataSource = self
        delegate = self
        
        viewModels = PageData.pageData.map { OnboardingPageViewModel(model: $0) }
        
        if let firstPage = viewModels.first {
            let firstViewController = OnboardingPage(viewModel: firstPage)
            setViewControllers(
                [firstViewController],
                direction: .forward,
                animated: true,
                completion: nil
            )
        }
        
        pageControl.numberOfPages = viewModels.count
        pageControl.currentPage = 0
    }
    
    private func setupHierarchy() {
        view.addSubview(pageControl)
        buttonStackView.addArrangedSubview(skipButton)
        buttonStackView.addArrangedSubview(nextButton)
        view.addSubview(buttonStackView)
    }
    
    private func setupUI() {
        skipButton.addAction(UIAction { [weak self] _ in
            self?.skipButtonTapped() }, for: .touchUpInside)
        nextButton.addAction(UIAction { [weak self] _ in
            self?.nextButtonTapped() }, for: .touchUpInside)
    }
    
    private func setupLayout() {
        pageControl.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(90)
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
    
    // MARK: - Actions
    
    private func nextButtonTapped() {
        pageIndex += 1
        
        if pageIndex < viewModels.count {
            let nextPage = viewModels[pageIndex]
            let nextViewController = OnboardingPage(viewModel: nextPage)
            setViewControllers(
                [nextViewController],
                direction: .forward,
                animated: true,
                completion: nil
            )
        } else {
            coordinator?.finishOnboarding()
        }
    }
    
    private func skipButtonTapped() {
        coordinator?.finishOnboarding()
    }
    
    private func updatePage() {
        pageControl.currentPage = pageIndex
        
        if pageIndex == viewModels.count - 1 {
            nextButton.setTitle("Начать", for: .normal)
            skipButton.isHidden = true
        } else {
            nextButton.setTitle("Далее", for: .normal)
            skipButton.isHidden = false
        }
    }
}

// MARK: - DataSource and Delegate extensions

extension OnboardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let currentViewController = viewController as? OnboardingPage,
              let currentIndex = viewModels.firstIndex(where: { $0.title == currentViewController.title }) else { return nil }
        
        let previousIndex = currentIndex - 1
        return previousIndex >= 0 ? OnboardingPage(viewModel: viewModels[previousIndex]) : nil
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let currentViewController = viewController as? OnboardingPage,
              let currentIndex = viewModels.firstIndex(where: { $0.title == currentViewController.title}) else { return nil }
        
        let nextIndex = currentIndex + 1
        return nextIndex < viewModels.count ? OnboardingPage(viewModel: viewModels[nextIndex]) : nil
    }
}

extension OnboardingViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        if completed,
           let currentViewController = pageViewController.viewControllers?.first as? OnboardingPage,
           let currentIndex = viewModels.firstIndex(where:  { $0.title == currentViewController.title }) {
            pageIndex = currentIndex
        }
    }
}
