//
//  TableViewModel.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 09.12.2025.
//

import UIKit

final class TransactionsViewModel {
    
    func dayTransactions(for day: Int) -> [TransactionModel] {
        return TransactionsData.transactions[day] ?? []
    }
}
