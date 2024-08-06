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
            VStack {
                HStack {
                    Text("< August")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                    Text("963,58")
                        .font(.title)
                        .foregroundColor(.green)
                        .padding()
                }
                List {
                    ForEach(year.entries.flatMap { $0.items }) { item in
                        HStack {
                            Text(item.name)
                                .foregroundColor(.black) // Text ohne Hintergrund
                            Spacer()
                            Text(String(format: "%.2f €", item.amount))
                                .foregroundColor(item.amount < 0 ? .red : .green)
                        }
                    }
                }
                .background(Color.clear)
                .scrollContentBackground(.hidden) // Entfernt den weißen Hintergrund der Liste
                Divider()
                    .overlay(.white)
                    .frame(width: 300)
                    .padding(.horizontal)
                
                HStack {
                    TextField("Name", text: $newItemName)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    TextField("Betrag", text: $newItemAmount)
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                Button("NEUER EINTRAG") {
                    addItem()
                }
                .frame(height: 50)
                .font(.title)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 10) // Padding unter dem Divider
            }
        }
    }
    
    func monthName(_ month: Int) -> String {
        return YearDetailView.dateFormatter.monthSymbols[month - 1]
    }
    
    func addItem() {
        guard let amount = Double(newItemAmount), !newItemName.isEmpty else { return }
        let newItem = Item(name: newItemName, amount: amount)
        if let firstMonth = year.entries.first?.month {
            viewModel.addItem(year: year.year, month: firstMonth, item: newItem)
        }
        newItemName = ""
        newItemAmount = ""
    }
    
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
