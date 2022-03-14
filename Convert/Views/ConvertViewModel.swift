//
//  ModelData.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import SwiftUI
import Combine

@MainActor
final class ConvertViewModel: ObservableObject {
    
    /// The current `UnitType`
    @Published var unitType: UnitType {
        didSet {
            if unitType != .currency {
                UserDefaultsHelper.setUnitType(unitType: unitType)
                
                units = UnitAPI.getUnits(for: unitType)
                
                // Update values for `fromUnit` and `toUnit`
                fromUnit = UserDefaultsHelper.getUnit(unitType: unitType, fromUnit: true)
                toUnit = UserDefaultsHelper.getUnit(unitType: unitType, fromUnit: false)
            }
        }
    }
    
    let unitTypes: [UnitType] = UnitAPI.getUnitTypes()

    /// A `Unit` array of the currently selected `unitType`
    @Published var units: [Unit]
    
    @Published var fromUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                toUnit = oldValue
            }
            
            UserDefaultsHelper.setUnit(unitType: unitType, units: units, unit: fromUnit, fromUnit: true)
        }
    }
    
    @Published var toUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                fromUnit = oldValue
            }
            
            UserDefaultsHelper.setUnit(unitType: unitType, units: units, unit: toUnit, fromUnit: false)
        }
    }
    
    @Published var fromValue: Double = 0
    
    var toValue: Double {
        let temp = Measurement(value: fromValue, unit: fromUnit.unit)
        let roundAmount = unitType == .currency ? 2 : 4
        return temp.converted(to: toUnit.unit).value.rounded(roundAmount)
    }

    init() {
        let unitType = UserDefaultsHelper.getUnitType()
        self.unitType = unitType
        self.units = UnitAPI.getUnits(for: unitType)
        self.fromUnit = UserDefaultsHelper.getUnit(unitType: unitType, fromUnit: true)
        self.toUnit = UserDefaultsHelper.getUnit(unitType: unitType, fromUnit: false)
    }
    
    func updateCurrencies() async {
        units = await CurrenciesService.shared.fetchCurrencies()
        fromUnit = UserDefaultsHelper.getUnitCurrency(units: units, fromUnit: true)
        toUnit = UserDefaultsHelper.getUnitCurrency(units: units, fromUnit: false)
    }
        
    func swapUnits() {
        swap(&fromUnit, &toUnit)
    }
}
