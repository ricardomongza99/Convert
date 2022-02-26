//
//  UnitCurrency.swift
//  Convert
//
//  Created by Ricardo Montemayor on 24/02/22.
//

import Foundation

final class UnitCurrency: Dimension {
    
    init(symbol: String, value: Double) {
        super.init(symbol: symbol, converter: UnitConverterLinear(coefficient: 1/value))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override static func baseUnit() -> UnitCurrency {
        return self.euro
    }
    
    static let euro = UnitCurrency(symbol: "EUR", value: 1)
}
