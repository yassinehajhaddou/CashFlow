//
//  MonthWithYearView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 09.08.24.
//
import SwiftUI

struct MonthWithYearView: View {
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(UIColor(red: 42/255, green: 60/255, blue: 152/255, alpha: 1)),
                    Color(UIColor(red: 22/255, green: 31/255, blue: 75/255, alpha: 1))
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack{
                HStack{
                    Text("2024")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .font(.largeTitle)
                    
                    Spacer()
                    
                    Text("2600")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                .padding(.trailing)
                
                VStack{
                    HStack{
                        Text("August")
                            .foregroundColor(.white)
                            .padding(.leading)
                            
                        
                        Spacer()
                        
                        Text("2600")
                            .foregroundColor(.white)
                            
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack{
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

#Preview {
    MonthWithYearView()
}
