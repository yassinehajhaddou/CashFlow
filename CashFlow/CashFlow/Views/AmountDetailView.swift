//
//  RevenueExpenditureView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import SwiftUI

struct AmountDetailView: View {
    @State private var isRevenue: Bool = true
    @State private var amount: String = ""
    @State private var date: Date = Date()
    @State private var category: String = ""
    @State private var note: String = ""
    @State private var showDatePicker = false
    @State private var showMonthDetailView = false
    
    let selectedColor = Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))
    let unselectedColor = Color.white
    let selectedBackgroundColor = Color.white
    let unselectedBackgroundColor = Color.clear
    
    let year: FinancialYear
    let viewModel: FinancialViewModel
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }()
    
    init(year: FinancialYear, viewModel: FinancialViewModel) {
        self.year = year
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)), Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Button(action: {
                            showMonthDetailView = true
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        
                    }
                    .padding(.vertical)
                    
                    // Tab Bar für Einnahmen/Ausgaben-Auswahl
                    HStack {
                        Button(action: {
                            isRevenue = true
                        }) {
                            HStack {
                                Image(systemName: "minus.circle")
                                    .foregroundColor(isRevenue ? selectedColor : unselectedColor)
                                Text("AUSGABE")
                                    .foregroundColor(isRevenue ? selectedColor : unselectedColor)
                            }
                            .padding()
                            .background(isRevenue ? selectedBackgroundColor : unselectedBackgroundColor)
                        }
                        
                        Button(action: {
                            isRevenue = false
                        }) {
                            HStack {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(isRevenue ? unselectedColor : selectedColor)
                                Text("EINNAHME")
                                    .foregroundColor(isRevenue ? unselectedColor : selectedColor)
                            }
                            .padding()
                            .background(isRevenue ? unselectedBackgroundColor : selectedBackgroundColor)
                        }
                    }
                    .border(Color.white, width: 6)
                    .cornerRadius(10)
                    .padding()
                    
                    TextField("BETRAG", text: $amount, prompt: Text("BETRAG").foregroundColor(amount.isEmpty ? Color.white.opacity(0.5) : Color.white))
                        .multilineTextAlignment(TextAlignment.center)
                        .frame(height: 30)
                        .keyboardType(.decimalPad)
                        .font(.title)
                        .padding()
                        .background(.clear)
                        .cornerRadius(10)
                        .foregroundColor(amount.isEmpty ? Color.white.opacity(0.5) : Color.white)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Text("TERMIN")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()
                    Button(action: {
                        showDatePicker = true
                    }) {
                        Text(dateFormatter.string(from: date))
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $showDatePicker) {
                        DatePicker("Datum auswählen", selection: $date, displayedComponents: .date)
                            .labelsHidden()
                            .colorInvert()
                            .colorMultiply(selectedColor)
                            .font(.subheadline)
                            .padding()
                            .background(.clear)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .accentColor(.secondary)
                            .datePickerStyle(WheelDatePickerStyle())
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("KATEGORIE")
                            .font(.subheadline)
                            .background(.clear)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .bold()
                        
                        NavigationLink(destination: NewCategoryView(viewModel: FinancialViewModel())) {
                            TextField("", text: $category, prompt: Text("Auswählen").foregroundColor(.white))
                                .multilineTextAlignment(TextAlignment.center)
                                .font(.headline)
                                .background(.clear)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom)
                    
                    Spacer()
                    
                    VStack{
                        Text("DETAILS")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .bold()
                        
                        TextField("", text: $note, prompt: Text("Notiz").foregroundColor(note.isEmpty ? Color.white.opacity(0.5) : Color.white))
                            .multilineTextAlignment(TextAlignment.center)
                            .font(.headline)
                            .background(.clear)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                    }
                    .padding(.bottom)
                    Spacer()
                    
                    VStack {
                        HStack {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .foregroundColor(.white)
                            
                            Button(action: {
                                // Reset all input values
                                self.amount = ""
                                self.date = Date()
                                self.category = ""
                                self.note = ""
                                self.isRevenue = true
                            }) {
                                Text("Wiederholen")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                        // Trennline setzen
                        Divider()
                            .overlay(.white)
                            .frame(width: 300)
                            .padding(.horizontal)
                        
                        Button(action: {
                            // Aktion für "Speichern"
                        }) {
                            Text("Speichern")
                                .foregroundColor(amount.isEmpty ? Color.white.opacity(0.5) : Color.white)
                                .font(.headline)
                                .padding()
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom)
                    .navigationDestination(isPresented: $showMonthDetailView) {MonthDetailView(year: year, viewModel: FinancialViewModel())
                    }
                }
            }
        }
    }
    
    #Preview {
        AmountDetailView(year: FinancialYear(year: 2024, entries: []), viewModel: FinancialViewModel())
    }
}
