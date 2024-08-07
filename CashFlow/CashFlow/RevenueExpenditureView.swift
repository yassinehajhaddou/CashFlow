//
//  RevenueExpenditureView.swift
//  CashFlow
//
//  Created by Phillip Wilke on 06.08.24.
//

import SwiftUI

struct RevenueExpenditureView: View {
    @State private var amount: String = ""
    @State private var date: Date = Date()
    @State private var category: String = ""
    @State private var details: String = ""
    @State private var isRecurring: Bool = false
    @State private var entries: [CashflowEntry] = []
    
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)), Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            
            VStack {
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "trash")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        // Aktion für den X-Button
                    }) {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                VStack{
                    HStack{
                        Text("Ausgabe")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        
                        
                        Text("Einnahme")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        
                        
                    }
                    .padding(.vertical, 10)
                    
                    ScrollView {
                        Section(header: Text("Neuer Eintrag").foregroundColor(.white)){
                            TextField("Betrag", text: $amount)
                                .frame(height: 30)
                                .keyboardType(.decimalPad)
                                .font(.subheadline)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                            
                            
                            DatePicker("Termin", selection: $date, displayedComponents: .date)
                                .frame(height: 30)
                                .font(.subheadline)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                            
                            
                            TextField("Kategorie", text: $category)
                                .font(.subheadline)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                            
                            TextField("Details", text: $details)
                                .font(.subheadline)
                                .padding()
                                .background(Color.white.opacity(0.3))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                            
                            
                            
                        }
                    }
                    
                    
                }
                
            }
            
        }
    }
    
    private func addEntry() {
        if let amountValue = Double(amount) {
            let newEntry = CashflowEntry(
                amount: amountValue,
                date: date,
                category: category,
                details: details,
                isRecurring: isRecurring,
                isIncome: amountValue > 0
            )
            entries.append(newEntry)
            clearForm()
        }
    }
    
    private func clearForm() {
        amount = ""
        date = Date()
        category = ""
        details = ""
        isRecurring = false
    }
}
    
    struct CashflowEntry: Identifiable {
        var id = UUID()
        var amount: Double
        var date: Date
        var category: String
        var details: String
        var isRecurring: Bool
        var isIncome: Bool
    }
    
    #Preview {
        RevenueExpenditureView()
    }
    
