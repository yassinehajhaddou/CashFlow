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

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)), Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    
                    Spacer()
                }
                
                // Tab bar for revenue/expenditure selection
                HStack {
                    Button(action: {
                        isRevenue = true
                    }) {
                        Text("AUSGABE")
                            .padding()
                            .background(isRevenue ? Color.white : Color.clear)
                            .foregroundColor(isRevenue ? Color.black : Color.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        isRevenue = false
                    }) {
                        Text("EINNAHME")
                            .padding()
                            .background(!isRevenue ? Color.white : Color.clear)
                            .foregroundColor(!isRevenue ? Color.black : Color.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                Spacer()
                
                TextField("Betrag", text: $amount)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                
                Spacer()
                
                Text("TERMIN")
                    .foregroundColor(.white)
                Text("01.08.2024")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("KATEGORIE")
                    .foregroundColor(.white)
                Text("Miete")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("DETAILS")
                    .foregroundColor(.white)
                Text("Notiz")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack {
                    HStack {
                        // Trennline setzen
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(.white)
                        
                        Text("Wiederholen")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    Divider()
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Button(action: {
                        // Aktion für "Speichern"
                    }) {
                        Text("Speichern")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    AmountDetailView()
}
