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
    @State private var note: String = ""
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
                
              
              
               
                Text("Neuer Eintrag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack{
                    HStack{
                        Text("AUSGABE")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        
                        
                        Text("EINNAHME")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                        
                        
                    }
                    .padding(.vertical, 30)
                    
                    
                    
                    VStack(alignment: .center){
                        

                            TextField("BETRAG", text: $amount, prompt: Text("BETRAG").foregroundColor(.white))
                                .multilineTextAlignment(TextAlignment.center)
                                .frame(height: 30)
                                .keyboardType(.decimalPad)
                                .font(.title)
                                .padding()
                                .background(.clear)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                           

                                DatePicker("", selection: $date, displayedComponents: .date)
                                    .labelsHidden()
                                    .colorInvert()
                                    .colorMultiply(Color.white)
                                    .font(.subheadline)
                                    .padding()
                                    .background(.clear)
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 20)
                                    .accentColor(.secondary)
                                    .datePickerStyle(WheelDatePickerStyle())
                            
                           VStack{
                               Text("KATEGORIE")
                                    .font(.subheadline)
                                    .background(.clear)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .bold()
                               
                               TextField("", text: $category, prompt: Text("Auswählen").foregroundColor(.white))
                                   .multilineTextAlignment(TextAlignment.center)
                                   .font(.subheadline)
                                   .background(.clear)
                                   .cornerRadius(10)
                                   .foregroundColor(.white)
                            
                           }
                           .padding(.bottom)
                
                              
                            
                            VStack{
                                Text("Details")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .bold()
                                
                                TextField("", text: $note, prompt: Text("Notiz").foregroundColor(.white))
                                    .multilineTextAlignment(TextAlignment.center)
                                    .font(.subheadline)
                                    .background(.clear)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                   
                            }
                            .padding(.bottom)
                    }
                   
                    
                    Spacer()
                    
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
  
            }
        }
    }
    
    private func addEntry() {
        if let amountValue = Double(amount) {
            let newEntry = CashflowEntry(
                amount: amountValue,
                date: date,
                category: category,
                details: note,
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
        note = ""
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
    

