//
//  FinancialEntry.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//


import Foundation

struct FinancialEntry: Identifiable, Hashable {
    let id = UUID() // Eindeutige ID für den Monatseintrag
    var month: String // Monat
    var transactions: [Transaction] // Liste der Posten für den Monat
    var total: Double {
        transactions.map { $0.amount }.reduce(0, +) // Berechnet die Gesamtsumme der Posten
    }
}
