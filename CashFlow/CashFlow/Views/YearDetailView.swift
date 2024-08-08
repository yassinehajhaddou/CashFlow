//
//  YearDetailView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 08.08.24.
//

import SwiftUI

struct YearDetailView: View {
    var year: FinancialYear
    
    @State private var currentMonth: Int = 1 // Aktueller Stand Januar
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
                VStack {
                    HStack {
                        Text("2024")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                        
                        Spacer()
                        
                        Text(sumOfItemsInYear().formatted(.currency(code: "EUR")))
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                        
                    }
                    
                    Spacer()
                }
                
                HStack{
                    Image(systemName: "gear")
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Button("EINSTELLUNGEN") {
                    }
                    .frame(height: 30)
                    .font(.headline)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.bottom)
                }
                
                Divider()
                
                    .background(Color.white)
                    .frame(width: 300)
                    .padding(.horizontal)
                
                Spacer()
                
                Button("NEUER EINTRAG") {
                }
                .frame(height: 50)
                .font(.title)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
        }
    }
    
    func sumOfItemsInYear() -> Double {
        let items = year.entries.flatMap { $0.items }
        return items.reduce(0, { $0 + $1.amount })
    }
    
}
struct YearsdDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleItems = [Transaction(name: "", amount: 2600.00)]
        let sampleEntries = [FinancialEntry(month: 1, items: sampleItems)]
        let sampleYear = FinancialYear(year: 2024, entries: sampleEntries)
        YearDetailView(year: sampleYear, viewModel: FinancialViewModel())
    }
}




