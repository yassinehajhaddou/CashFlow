//
//  ContentView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FinancialViewModel() // Verwaltet die Finanzdaten
    @State private var selectedYear: Int? // Das aktuell ausgewählte Jahr
    @State private var selectedMonth: Int? // Der aktuell ausgewählte Monat
    @State private var showLogo = true // Zeigt das Logo oder die Finanzübersicht an
    
    var body: some View {
        RevenueExpenditureView(isRevenue:.constant(true) )
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
