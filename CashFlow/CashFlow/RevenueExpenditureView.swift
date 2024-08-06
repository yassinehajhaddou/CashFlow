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
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)), Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("Ausgabe")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                    
                    
                    Text("Einnahme")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 10)
                    
                    
                }
                .padding(.vertical, 10)
                
                ScrollView {
                    Section(header: Text("Neuer Eintrag").foregroundColor(.white)){
                        TextField("Betrag", text: $amount)
                            .keyboardType(.decimalPad)
                            .font(.subheadline)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                        
                        DatePicker("Termin", selection: $date, displayedComponents: .date)
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
    
    #Preview {
        RevenueExpenditureView()
    }


