//
//  Untitled.swift
//  Budget_MVVM-C
//
//  Created by Макс Макеев on 06.12.2025.
//

struct TransactionModel {
    let title: String
    let ammount: Double
    let isIncome: Bool
}

final class TransactionsData {
    static let transactions: [Int: [TransactionModel]] = [
        1: [
            TransactionModel(title: "Заплата", ammount: 10000, isIncome: true),
            TransactionModel(title: "Продажа на Авито", ammount: 500, isIncome: true),
            TransactionModel(title: "Платеж за электричество", ammount: -200, isIncome: false)
        ],
        2: [
            TransactionModel(title: "Платеж за аренду", ammount: -1000, isIncome: false),
            TransactionModel(title: "Платеж за интернет", ammount: -100, isIncome: false)
        ],
        3: [
            TransactionModel(title: "Платеж за бензин", ammount: -1000, isIncome: false),
            TransactionModel(title: "Пополнение карты", ammount: 500, isIncome: true),
            TransactionModel(title: "Покупка в магазине", ammount: -500, isIncome: false)
        ],
        4: [
            TransactionModel(title: "Платеж за аренду", ammount: -1000, isIncome: false),
            TransactionModel(title: "Платеж за интернет", ammount: -100, isIncome: false)
        ],
        5: [
            TransactionModel(title: "Платеж за бензин", ammount: -1000, isIncome: false),
            TransactionModel(title: "Пополнение карты", ammount: 500, isIncome: true),
            TransactionModel(title: "Покупка в магазине", ammount: -500, isIncome: false)
        ],
        6: [
            TransactionModel(title: "Платеж за аренду", ammount: -1000, isIncome: false),
            TransactionModel(title: "Платеж за интернет", ammount: -100, isIncome: false)
        ],
        7: [
            TransactionModel(title: "Платеж за бензин", ammount: -1000, isIncome: false),
            TransactionModel(title: "Пополнение карты", ammount: 500, isIncome: true),
            TransactionModel(title: "Покупка в магазине", ammount: -500, isIncome: false)
        ],
        8: [
            TransactionModel(title: "Платеж за аренду", ammount: -1000, isIncome: false),
            TransactionModel(title: "Платеж за интернет", ammount: -100, isIncome: false)
        ],
        9: [
            TransactionModel(title: "Платеж за бензин", ammount: -1000, isIncome: false),
            TransactionModel(title: "Пополнение карты", ammount: 500, isIncome: true),
            TransactionModel(title: "Покупка в магазине", ammount: -500, isIncome: false)
        ],
        10: [
            TransactionModel(title: "Платеж за аренду", ammount: -1000, isIncome: false),
            TransactionModel(title: "Платеж за интернет", ammount: -100, isIncome: false)
        ],
        11: [
            TransactionModel(title: "Платеж за бензин", ammount: -1000, isIncome: false),
            TransactionModel(title: "Пополнение карты", ammount: 500, isIncome: true),
            TransactionModel(title: "Покупка в магазине", ammount: -500, isIncome: false)
        ],
        12: [
            TransactionModel(title: "Платеж за аренду", ammount: -1000, isIncome: false),
            TransactionModel(title: "Платеж за интернет", ammount: -100, isIncome: false)
        ],
        13: [
            TransactionModel(title: "Платеж за бензин", ammount: -1000, isIncome: false),
            TransactionModel(title: "Пополнение карты", ammount: 500, isIncome: true),
            TransactionModel(title: "Покупка в магазине", ammount: -500, isIncome: false)
        ],
        14: [
            TransactionModel(title: "Платеж за аренду", ammount: -1000, isIncome: false),
            TransactionModel(title: "Платеж за интернет", ammount: -100, isIncome: false)
        ],
        15: [
            TransactionModel(title: "Платеж за бензин", ammount: -1000, isIncome: false),
            TransactionModel(title: "Пополнение карты", ammount: 500, isIncome: true),
            TransactionModel(title: "Покупка в магазине", ammount: -500, isIncome: false)
        ]
    ]
}
