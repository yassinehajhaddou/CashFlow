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
        NavigationView {
            ZStack {
                // Zeigt das Logo, wenn showLogo wahr ist
                if showLogo {
                    LogoView()
                        .background(Color.black)
                } else {
                    
                    VStack {
                        // Zeigt den Link zur Detailansicht, wenn Jahr und Monat ausgewählt sind
                        if let year = selectedYear, let month = selectedMonth {
                            NavigationLink(
                                destination: YearDetailView(
                                    year: viewModel.years.first { $0.year == year } ?? FinancialYear(year: year, entries: []),
                                    viewModel: viewModel
                                )
                            ) {
                                Text("Details anzeigen für \(viewModel.monthName(month)) \(year)")
                                    .foregroundColor(Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1)))
                                    .padding()
                                    .background(Color.white) // Hintergrundfarbe für den Button
                                    .cornerRadius(10)
                            }
                        }
                        // Picker zur Auswahl des Jahres
                        Picker("Jahr wählen", selection: $selectedYear) {
                            ForEach(viewModel.years.map(\.year), id: \.self) { year in
                                Text("\(year)").tag(year as Int?)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .padding()
                        // Picker zur Auswahl des Monats
                        Picker("Monat wählen", selection: $selectedMonth) {
                            ForEach(1...12, id: \.self) { month in
                                Text(viewModel.monthName(month)).tag(month as Int?)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .padding()
                        // Link zur neuen Kategorieansicht
                        NavigationLink(destination: NewCategoryView(viewModel: viewModel)) {
                            Text("Neue Kategorie erstellen")
                                .padding()
                                .foregroundColor(Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1)))
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    .navigationTitle("Finanzübersicht")
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)),
                                Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    ) // Hintergrundfarbe der Finanzübersicht
                    .foregroundColor(.white) // Textfarbe der Finanzübersicht
                }
            }
            .onAppear {
                viewModel.loadData() // Lädt die Daten beim Start der Ansicht
            }
            .onReceive(NotificationCenter.default.publisher(for: .showContentView)) { _ in
                withAnimation {
                    showLogo = false // Blendet das Logo aus und zeigt die Finanzübersicht
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









