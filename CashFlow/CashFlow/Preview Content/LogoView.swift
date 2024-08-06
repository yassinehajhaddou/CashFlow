//
//  LogoView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import SwiftUI

struct LogoView: View {
 var body: some View {
  GeometryReader { geometry in
   ZStack {
    Color.white
    Image("cashflow_logo")
     .resizable()
     .scaledToFill()
     .background(.black)
     .aspectRatio(contentMode: .fit)
     .frame(width: geometry.size.width, height: geometry.size.height)
   }
   .onTapGesture {
    withAnimation {
     NotificationCenter.default.post(name: .showContentView, object: nil)
    }
   }
  }
 }
}
extension Notification.Name {
 static let showContentView = Notification.Name("showContentView")
    
}
#Preview {
  LogoView()
}











Nachricht an Antonio Loggia, Marcel R. Fischer, Phillip Wilke









