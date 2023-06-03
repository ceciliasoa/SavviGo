//
//  NumberFormatter.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 30/05/23.
//

import UIKit

extension NumberFormatter {
    static func getCurrencyFormatter() -> NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return currencyFormatter
    }
}

extension Double {
    public func getCurrencyFormat() -> String {
        let formatter = NumberFormatter.getCurrencyFormatter()
        return formatter.string(from: NSDecimalNumber(value: self)) ?? ""
    }
}
