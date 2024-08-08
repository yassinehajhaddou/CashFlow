//
//  FinancialViewModel.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import Foundation

class FinancialViewModel: ObservableObject {
    @Published var years: [FinancialYear] = [] // Liste der Finanzjahre
    
    init() {
        loadData() // Lädt die Daten beim Initialisieren des ViewModels
    }
    
    func loadData() {
        // Initiale Beispieldaten laden
        let sampleItems = [Transaction(name: "Einkommen", amount: 3000), Transaction(name: "Miete", amount: -1500)]
        let sampleEntries = (1...12).map { FinancialEntry(month: $0, items: sampleItems) }
        let sampleYears = (2013...2024).map { FinancialYear(year: $0, entries: sampleEntries) }
        years = sampleYears
    }
    
    func monthName(_ month: Int) -> String {
        return FinancialViewModel.dateFormatter.monthSymbols[month - 1] // Gibt den Namen des Monats zurück
    }
    
    func addItem(year: Int, month: Int, item: Transaction) {
        guard let yearIndex = years.firstIndex(where: { $0.year == year }) else { return }
        var entries = years[yearIndex].entries
        guard let entryIndex = entries.firstIndex(where: { $0.month == month }) else { return }
        var items = entries[entryIndex].items
        items.append(item)
        entries[entryIndex] = FinancialEntry(month: month, items: items)
        years[yearIndex] = FinancialYear(year: year, entries: entries)
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










