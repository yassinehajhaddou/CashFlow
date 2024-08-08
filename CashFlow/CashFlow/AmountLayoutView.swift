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
    HStack {
      Text(item.name)
        .padding(.leading,24)
        .foregroundColor(.white) // Text ohne Hintergrund
      Spacer()
      Text(String(format: "%.2f €", item.amount))
        .foregroundColor(item.amount < 0 ? .red : .green)
    }  .padding(.horizontal)
      .background(Color.clear)
      .scrollContentBackground(.hidden)
  }
}
struct AmountLayoutView_Previews: PreviewProvider {
  static var previews: some View {
    let sampleItem = Item(name: "Sample Item", amount: 100.00)
    AmountLayoutView(item: .constant(sampleItem))
  }
}

