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
    
    static let euro = UnitCurrency(symbol: "EUR", converter: UnitConverterLinear(coefficient: 1))
}
