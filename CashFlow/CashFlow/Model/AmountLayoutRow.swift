//
//  AmountLayoutRow.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 08.08.24.
//

import SwiftUI

struct AmountLayoutRow: View {
    @Binding var item : Transaction
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
#Preview {
    AmountLayoutRow(item: .constant(Transaction(name: "Miete", amount: 720.34)))
}
