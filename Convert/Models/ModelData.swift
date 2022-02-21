//
//  ModelData.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import Foundation

final class ModelData {
    let massUnits: [Unit] = [
        Unit(name: "Tons", symbol: "t", unit: UnitMass.metricTons),
        Unit(name: "Kilograms", symbol: "kg", unit: UnitMass.kilograms),
        Unit(name: "Grams", symbol: "g", unit: UnitMass.grams),
        Unit(name: "Milligrams", symbol: "mg", unit: UnitMass.milligrams),
        Unit(name: "Ounces", symbol: "oz", unit: UnitMass.ounces),
        Unit(name: "Pounds", symbol: "lb", unit: UnitMass.pounds),
    ]
}
