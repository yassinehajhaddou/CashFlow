//
//  DataManager.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//
import Foundation

class FinancialManager {
    static let shared = FinancialManager()
    
    private init(withSampleData: Bool = false) {
        if withSampleData{
            years = FinancialManager.generateSampleFinanceData()
        
        }
    }
    
    static let sampleManager = FinancialManager(withSampleData: true)
    
    private(set) var years: [FinancialYear] = []
    
    func addItem(year: Int, month: Int, item: Transaction) {
        guard let yearIndex = years.firstIndex(where: { $0.year == year }) else { return }
        var entries = years[yearIndex].entries
        guard let entryIndex = entries.firstIndex(where: { $0.month == month }) else { return }
        var items = entries[entryIndex].items
        items.append(item)
        entries[entryIndex] = FinancialEntry(month: month, items: items)
        years[yearIndex] = FinancialYear(year: year, entries: entries)
    }
    func removeItem(){
        
    }
}

extension FinancialManager {
    static func generateSampleFinanceData() -> [FinancialYear]{
        let sampleItems = [Transaction(name: "Einkommen", amount: 3000), Transaction(name: "Miete", amount: -1500)]
        let sampleEntries = (1...12).map { FinancialEntry(month: $0, items: sampleItems) }
        let sampleYears = (2013...2024).map { FinancialYear(year: $0, entries: sampleEntries) }
        return sampleYears
    }
}
