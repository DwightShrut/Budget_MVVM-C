//
//  CustomNavViewModel.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 10.11.2025.
//

import UIKit

final class DailyViewModel {
    
    var title: String {
        return DailyData.dailyData.title
    }
    
    var rightButtonImage: UIImage {
        guard let image = UIImage(systemName: DailyData.dailyData.rightBarButtonText ?? "") else { return UIImage() }
        return image
    }
    
    var dateArray: [String] {
        return DailyData.dailyData.dateArray ?? []
    }
    
    var daysArray: [String] {
        return DailyData.dailyData.daysArray ?? []
    }
}
