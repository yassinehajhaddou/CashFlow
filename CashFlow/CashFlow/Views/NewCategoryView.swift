//
//  NewCategory.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import SwiftUI

struct NewCategoryView: View {
    @State private var categoryName: String = ""
    @ObservedObject var viewModel: FinancialViewModel
    
    var body: some View {
        
        NavigationStack {
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
                        .foregroundColor(Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1)))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.addCategory(name: categoryName)
                    }) {
                        Text("Speichern")
                            .frame(width: 200, height: 50)
                            .background(categoryName.isEmpty ? Color.gray .opacity(0.3) : Color.white)
                            .foregroundColor(categoryName.isEmpty ? Color.white : Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1)))
                            .cornerRadius(10)
                    }
                    .disabled(categoryName.isEmpty ? true : false)
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        // Aktionen zum Abbrechen hinzufügen
                    }) {
                        Text("Abbrechen")
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 50)
                }
            }
        }
    }
}


struct NewCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NewCategoryView(viewModel: FinancialViewModel())
    }
}
