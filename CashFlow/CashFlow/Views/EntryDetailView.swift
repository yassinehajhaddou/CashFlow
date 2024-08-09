//
//  EntryDetailView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 09.08.24.
//

import SwiftUI

struct EntryDetailView: View {
    
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
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.title)
                       
                    Text("Lebensmittel")
                        .foregroundColor(.white)
                        .font(.title)
                        
                    Spacer()
                    
                    Text("-200")
                        .foregroundColor(.red)
                        .font(.title)
                        
                }
                
                HStack{
                    Text("Einkäufe aus diversen Märkten")
                        .foregroundColor(.white).opacity(0.5)
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("-200")
                        .foregroundColor(.red).opacity(0.5)
                        .font(.headline)
                }
                
                Text("03.08.2024")
                    .foregroundColor(.white).opacity(0.5)
                    .font(.headline)
                
                VStack(alignment: .center){
        
                    Spacer()
                    
                    Divider()
                        .background(Color.white)
                        .frame(width: 300)
                        .padding(.leading, 24)
                    
                    Spacer()
                    
                    Button("NEUER EINTRAG") {
                    }
                    .frame(height: 50)
                    .font(.title)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.leading, 32)
                }
                }
            .padding(.horizontal)
        }
    }
}

struct EntryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntryDetailView()
    }
}
