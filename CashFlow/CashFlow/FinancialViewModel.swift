//
//  FinancialViewModel.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import Foundation

class FinancialViewModel: ObservableObject {
    @Published var years: [FinancialYear] = FinancialManager.generateSampleFinanceData() // Liste der Finanzjahre
    @Published var transaction: [Transaction] = [] // SampleData für unsere MonthDetailView
    
    func monthName(_ month: Int) -> String {
        return FinancialViewModel.dateFormatter.monthSymbols[month - 1] // Gibt den Namen des Monats zurück
    }
    
    func addCategory(name: String) {
        // Hier können Sie die Logik zum Hinzufügen einer Kategorie implementieren
    }
    
    // Statischer DateFormatter zur Vermeidung von Leistungsproblemen bei häufigem Zugriff
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        return formatter
    }()
}










