//
//  LogoView.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black
                Image("cashflow_logo")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
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
    SplashView()
}









