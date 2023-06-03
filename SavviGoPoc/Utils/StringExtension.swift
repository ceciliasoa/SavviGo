//
//  String.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 30/05/23.
//

import Foundation

extension String {
    public func valueFromCurrency() -> Double {
        let value: Int = Int(self) ?? 0
        let valueFinal: Double = value == 0 ? 0.0 : Double(value)/100.0
        return valueFinal
    }
}
