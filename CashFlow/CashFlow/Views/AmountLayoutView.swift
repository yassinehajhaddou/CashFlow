//
//  AmountLayoutView.swift
//  CashFlow
//
//  Created by Marcel Roger Fischer on 08.08.24.
//

//
// AmountLayout.swift
// CashFlow
//
// Created by Antonio Loggia on 07.08.24.
//
import SwiftUI
struct AmountLayoutView: View {
  @Binding var item : Item
  var body: some View {
      AmountLayoutRow(item: .constant(Item(name: "Miete", amount: 720.34)))
  }
}
struct AmountLayoutView_Previews: PreviewProvider {
  static var previews: some View {
    let sampleItem = Item(name: "Sample Item", amount: 100.00)
    AmountLayoutView(item: .constant(sampleItem))
  }
}

