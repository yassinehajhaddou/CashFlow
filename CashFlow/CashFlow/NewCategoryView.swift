//
//  NewCategory.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import SwiftUI
struct NewCategoryView: View {
    @State private var categoryName: String = ""
    @State private var enableButton: Bool = false //  Button-Status speichern
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)), Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("Neue Kategorie erstellen")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 100)
                
                TextField("Kategorie eingeben", text: $categoryName)
                    .font(.subheadline)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(width: 290)
                    .background(Color.white).opacity(0.3)
                    .cornerRadius(10)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                Spacer()
                
                Button(action: {
                }) {
                    Text("Speichern")
                        .frame(width: 200, height: 50)
                        .background(Color.white)
                        .foregroundColor(Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1)))
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)
                
                Button(action: {
                }) {
                    Text("Abbrechen")
                        .foregroundColor(.white).opacity(0.5)
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    NewCategoryView()
}
