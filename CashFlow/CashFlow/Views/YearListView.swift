//
//  YearDetailView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 08.08.24.
//

import SwiftUI

struct YearListView: View {
    
    @State private var currentMonth: Int = 1 // Aktueller Stand Januar
    @ObservedObject var viewModel: FinancialViewModel
    
    var body: some View {
        
        NavigationStack {
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
                    ForEach(viewModel.years, id: \.self){ year in
                        NavigationLink(value: year) {
                        HStack{
                                Text("\(year.year)")
                                .font(.title)
                                .foregroundColor(.white)
                                .bold()
                            
                                Spacer()
                            
                            Text("\(year.total.formatted())")
                                .foregroundColor(.white)
                                .font(.title)
                               

                            }
                            .padding(.horizontal)
                        }
                       
                    }
                    
                    Spacer()
                    
                    VStack{
                        Spacer()
                        HStack{
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                                .padding(.bottom)
                            
                            Button("EINSTELLUNGEN") {
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom)
                        }
                        Divider()
                            .background(Color.white)
                            .frame(width: 300)
                            .padding(.horizontal)
                        
                        Button("NEUER EINTRAG") {
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    }
                }
            }
            .navigationDestination(for: FinancialYear.self) { year in
                YearDeatailView(year: year)
            }
//            .navigationDestination(for: FinancialEntry.self) { entry in
//                MonthDetailView(year: year)
//            }
        }
    }
    
//    func sumOfItemsInYear() -> Double {
//        let items = year.entries.flatMap { $0.transactions }
//        return items.reduce(0, { $0 + $1.amount })
//    }
    
}
struct YearsdListView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleItems = [Transaction(name: "", amount: 2600.00)]
        let sampleEntries = [FinancialEntry(month: "Januar", transactions: sampleItems)]
        let sampleYear = FinancialYear(year: "2024", entries: sampleEntries)
        YearListView(viewModel: FinancialViewModel())
    }
}




