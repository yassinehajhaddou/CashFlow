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

    let selectedColor = Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))
    let unselectedColor = Color.white
    let selectedBackgroundColor = Color.white
    let unselectedBackgroundColor = Color.clear

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)), Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    
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
                
                TextField("Betrag", text: $amount)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                
                
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
                        Image(systemName: "arrow.triangle.2.circlepath")
                            .foregroundColor(.white)
                        
                        Text("Wiederholen")
                            .font(.headline)
                            .foregroundColor(.white)
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
                            .foregroundColor(.white).opacity(0.7)
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
