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
    AmountLayoutRow()
  }
}
struct AmountLayoutView_Previews: PreviewProvider {
  static var previews: some View {
    let sampleItem = Item(name: "Sample Item", amount: 100.00)
    AmountLayoutView(item: .constant(sampleItem))
  }
}

