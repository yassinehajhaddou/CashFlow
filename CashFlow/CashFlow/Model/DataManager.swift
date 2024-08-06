//
//  DataManager.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//
import Foundation

class DataManager {
    static let shared = DataManager()
    private init() { }
    private(set) var years: [FinancialYear] = []
    
    func loadData() {
        let sampleItems = [Item(name: "Einkommen", amount: 3000), Item(name: "Miete", amount: -1500)]
        let sampleEntries = (1...12).map { FinancialEntry(month: $0, items: sampleItems) }
        years = (2013...2024).map { FinancialYear(year: $0, entries: sampleEntries) }
    }
    
    func addItem(year: Int, month: Int, item: Item) {
        guard let yearIndex = years.firstIndex(where: { $0.year == year }) else { return }
        var entries = years[yearIndex].entries
        guard let entryIndex = entries.firstIndex(where: { $0.month == month }) else { return }
        var items = entries[entryIndex].items
        items.append(item)
        entries[entryIndex] = FinancialEntry(month: month, items: items)
        years[yearIndex] = FinancialYear(year: year, entries: entries)
    }
    
}
