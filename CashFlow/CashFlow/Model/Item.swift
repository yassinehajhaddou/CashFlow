//
//  Item.swift
//  CashFlow
//
//  Created by Yassine Haj Haddou on 06.08.24.
//

import Foundation

struct Item: Identifiable {
    let id = UUID() // Eindeutige ID für den Posten
    var name: String // Name des Postens
    var amount: Double // Betrag des Postens
}
