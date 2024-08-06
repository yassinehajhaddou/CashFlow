//
//  YearDetailView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import SwiftUI
struct YearDetailView: View {
    var year: FinancialYear
    @State private var newItemName: String = ""
    @State private var newItemAmount: String = ""
    @State private var showAddItem = false
    @ObservedObject var viewModel: FinancialViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)),
                    Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            List {
                ForEach(year.entries) { entry in
                    Section(header: Text(monthName(entry.month))
                        .foregroundColor(.black)) {
                            ForEach(entry.items) { item in
                                HStack {
                                    Text(item.name)
                                    Spacer()
                                    Text(String(format: "%.2f €", item.amount))
                                }
                                .foregroundColor(.black)
                            }
                        }
                }
            }
            .background(Color.blue)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddItem.toggle() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
            }
            .sheet(isPresented: $showAddItem) {
                VStack(spacing: 20) {
                    TextField("Name", text: $newItemName)
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1)))
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    TextField("Betrag", text: $newItemAmount)
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1)))
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    Button("Hinzufügen") {
                        addItem()
                        showAddItem = false
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.white)
                    .foregroundColor(Color(red: 42/255, green: 60/255, blue: 152/255))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
                .background(Color(red: 42/255, green: 60/255, blue: 152/255))
                .cornerRadius(10)
            }
        }
    }
    
    func monthName(_ month: Int) -> String {
        return YearDetailView.dateFormatter.monthSymbols[month - 1] // Gibt den Namen des Monats zurück
    }
    
    func addItem() {
        guard let amount = Double(newItemAmount), !newItemName.isEmpty else { return }
        let newItem = Item(name: newItemName, amount: amount)
        if let firstMonth = year.entries.first?.month {
            viewModel.addItem(year: year.year, month: firstMonth, item: newItem)
        }
    }
    
    // Statischer DateFormatter zur Vermeidung von Leistungsproblemen bei häufigem Zugriff
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        return formatter
    }()
    
}
struct YearDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleItems = [Item(name: "Beispiel", amount: 100.00)]
        let sampleEntries = [FinancialEntry(month: 1, items: sampleItems)]
        let sampleYear = FinancialYear(year: 2024, entries: sampleEntries)
        YearDetailView(year: sampleYear, viewModel: FinancialViewModel())
    }
}










