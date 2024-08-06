//
//  FinancialEntry.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//


import Foundation
struct FinancialEntry: Identifiable {
    let id = UUID() // Eindeutige ID für den Monatseintrag
    var month: Int // Monat
    var items: [Item] // Liste der Posten für den Monat
    var total: Double {
        items.map { $0.amount }.reduce(0, +) // Berechnet die Gesamtsumme der Posten
    }
}
