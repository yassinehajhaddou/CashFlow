//
//  DataManager.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import Foundation

class FinancialManager: ObservableObject  {
    static let shared = FinancialManager()
    
    private init(withSampleData: Bool = false) {
        if withSampleData{
            years = FinancialManager.generateSampleFinanceData()
        
        }
    }
    
    static let sampleManager = FinancialManager(withSampleData: true)
    
    private(set) var years: [FinancialYear] = []
    
//    func addItem(year: Int, month: Int, item: Transaction) {
//        guard let yearIndex = years.firstIndex(where: { $0.year == year }) else { return }
//        var entries = years[yearIndex].entries
//        guard let entryIndex = entries.firstIndex(where: { $0.month == month }) else { return }
//        var items = entries[entryIndex].transactions
//        items.append(item)
//        entries[entryIndex] = FinancialEntry(month: month, transactions: items)
//        years[yearIndex] = FinancialYear(year: year, entries: entries)
//    }
    
    func removeItem(){
        
    }
}

extension FinancialManager {
    static func generateSampleFinanceData() -> [FinancialYear]{
        
        let sampleTransactions = [
            Transaction(name: "Gehalt", amount: 4000),
            Transaction(name: "Autoversicherung", amount: -70.00),
            Transaction(name: "Klimaanlage", amount: -240.00),
            Transaction(name: "Flugtickets", amount: -898.99),
            Transaction(name: "Kleidung", amount: -250.60),
            Transaction(name: "Fussballschuhe", amount: -99.34)
        ]
        
        let sampleEntries = [FinancialEntry(month: "Januar", transactions: sampleTransactions),FinancialEntry(month: "Februar", transactions: sampleTransactions),FinancialEntry(month: "März", transactions: sampleTransactions), FinancialEntry(month: "April", transactions: sampleTransactions), FinancialEntry(month: "Mai", transactions: sampleTransactions),FinancialEntry(month: "Juni", transactions: sampleTransactions), FinancialEntry(month: "Juli", transactions: sampleTransactions), FinancialEntry(month: "August", transactions: sampleTransactions), FinancialEntry(month: "September", transactions: sampleTransactions), FinancialEntry(month: "Oktober", transactions: sampleTransactions), FinancialEntry(month: "November", transactions: sampleTransactions), FinancialEntry(month: "Dezember", transactions: sampleTransactions)]
        
        let sampleYears = [FinancialYear(year: "2024", entries: sampleEntries),FinancialYear(year: "2023", entries: sampleEntries)]
        
        return sampleYears
    }
}
