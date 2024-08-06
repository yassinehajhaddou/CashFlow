//
//  FinancialYear.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import Foundation

struct FinancialYear: Identifiable {
 let id = UUID() // Eindeutige ID für das Finanzjahr
 var year: Int // Jahr
 var entries: [FinancialEntry] // Einträge für jeden Monat
 var total: Double {
  entries.map { $0.total }.reduce(0, +) // Berechnet die Gesamtsumme aller Einträge
 }
}
