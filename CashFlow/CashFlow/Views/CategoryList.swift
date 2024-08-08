//
// CategoryList.swift
// CashFlow
//
// Created by Phillip Wilke on 07.08.24.
//
import SwiftUI
struct CategoryList: View {
    @State private var newCategory: String = ""
    @State private var withoutCategory: String = ""
    @State private var categoryName: String = ""
    var body: some View {
        NavigationStack{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)), Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                VStack{
                    ScrollView(showsIndicators : false) {
                        Spacer()
                        Button(action:{
                        }) {
                            Text("Ohne Kategorie")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Gehalt")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Miete")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Nebenkosten")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Haushalt")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Lebensmittel")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Freizeit")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Drogerie")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Gesundheit")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Kommunikation")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Versicherung")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Sport")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Geschenke")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                        Button(action:{
                        }) {
                            Text("Urlaub")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    HStack{
                            Button(action:{
                            }) {
                                NavigationLink(destination: NewCategoryView(viewModel: FinancialViewModel())) {
                                Text("Neue Kategorie")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(categoryName.isEmpty ? Color.gray .opacity(0.3) : Color.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    Spacer()
                    Text("Du kannst die Kategorien in den Einstellungen bearbeiten")
                        .padding(.top, 9.5)
                        .padding(.bottom, 8)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
        .tint(Color.white)
    }
}
#Preview {
    CategoryList()
}
