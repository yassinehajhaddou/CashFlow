//
//  YearDeatailView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 09.08.24.
//

import SwiftUI

struct YearDeatailView: View {
    var year: FinancialYear
    var body: some View {
        
        NavigationStack{
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)),
                        Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(alignment: .leading){
                    
                    Text(year.year)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                    
                    ForEach(year.entries, id: \.self) { entry in
                        HStack{
                            Text("\(entry.month)")
                                .foregroundColor(.white)
                                .padding(.leading, 16)
                            
                            Spacer()
                            
                            Text("\(entry.total)")
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                }
                
                VStack{
                    Spacer()
                    
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                            .padding(.bottom)
                        
                        Button("EINSTELLUNGEN") {
                        }
                        .frame(height: 30)
                        .font(.headline)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom)
                    }
                    
                    Divider()
                        .background(Color.white)
                        .frame(width: 300)
                        .padding(.horizontal)
                    
                    Button("NEUER EINTRAG") {
                    }
                    .frame(height: 50)
                    .font(.title)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
                }
            }
        }
    }
}


#Preview {
    YearDeatailView(year: FinancialViewModel().years.first!)
}
