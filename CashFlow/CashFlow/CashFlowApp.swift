//
//  CashFlowApp.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import SwiftUI
@main
struct CashFlowApp: App {
  @StateObject var viewModel = FinancialViewModel() // Initialisiert das ViewModel
  var body: some Scene {
    WindowGroup {
      //ContentView(viewModel: viewModel)
      NewCategoryView(viewModel: viewModel) // Übergibt das ViewModel
    }
  }
}
