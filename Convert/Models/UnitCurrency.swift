//
//  UnitCurrency.swift
//  Convert
//
//  Created by Ricardo Montemayor on 24/02/22.
//

import Foundation

final class UnitCurrency: Dimension {
    override static func baseUnit() -> UnitCurrency {
        return self.euro
    }
    
    static let mexicanPeso = UnitCurrency(symbol: "MXN", converter: UnitConverterLinear(coefficient: 1/22.2))
    static let unitedStatesDollar = UnitCurrency(symbol: "USD", converter: UnitConverterLinear(coefficient: 1/1.12))
    static let euro = UnitCurrency(symbol: "EUR", converter: UnitConverterLinear(coefficient: 1))
}
