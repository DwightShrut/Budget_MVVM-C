//
//  OnboardingModel.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 24.10.2025.
//

struct OnboardingModel {
    var imageName: String?
    var title: String?
    var description: String?
    var buttonTitle: String?
    var isLast: Bool?
}

final class PageData {
    static let pageData: [OnboardingModel] = [
        OnboardingModel(imageName: Icons.onboardingIcon1,
                        title: Titles.onboardingTitle1,
                        description: Descriptions.onboardingDescription1
                       ),
        OnboardingModel(imageName: Icons.onboardingIcon2,
                        title: Titles.onboardingTitle2,
                        description: Descriptions.onboardingDescription2
                       ),
        OnboardingModel(imageName: Icons.onboardingIcon3,
                        title: Titles.onboardingTitle3,
                        description: Descriptions.onboardingDescription3
                       )
    ]
}
