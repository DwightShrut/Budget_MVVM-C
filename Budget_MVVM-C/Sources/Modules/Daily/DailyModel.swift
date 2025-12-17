//
//  CustomNavModel.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 10.11.2025.
//

struct DailyModel {
    var title: String
    var rightBarButtonText: String?
    var dateArray: [String]?
    var daysArray: [String]?
}

final class DailyData {
    
    static let dailyData: DailyModel =
    DailyModel(
        title: "Транзакции за день",
        rightBarButtonText: "magnifyingglass",
        dateArray: ["28", "29", "30", "1", "2", "3", "4", "5"],
        daysArray: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    )
}
