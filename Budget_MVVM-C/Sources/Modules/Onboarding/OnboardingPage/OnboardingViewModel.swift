//
//  OnboardingViewModel.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 31.10.2025.
//

import UIKit

final class OnboardingPageViewModel {
    private let model: OnboardingModel
    
    init(model: OnboardingModel) {
        self.model = model
    }
    
    var image: UIImage? {
        return UIImage(named: model.imageName ?? "")
    }
    
    var title: String {
        return model.title ?? ""
    }
    
    var description: String {
        return model.description ?? ""
    }
    
    var isLastPage: Bool {
        return model.isLast ?? false
    }
}
