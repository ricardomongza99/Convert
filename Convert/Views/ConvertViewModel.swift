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
    
    // MARK: - PROPERTIES
    
    /// The current `UnitType`
    @Published var unitType: UnitType {
        didSet {
            if unitType != .currency {
                UserDefaultsHelper.setUnitType(for: unitType)
                
                units = UnitAPI.getUnits(for: unitType)
                
                // Update values for `fromUnit` and  `toUnit`
                fromUnit = UserDefaultsHelper.getUnit(for: unitType, fromUnit: true)
                toUnit = UserDefaultsHelper.getUnit(for: unitType, fromUnit: false)
            }
            // Update value for `fromValue`
            fromValue = UserDefaultsHelper.getValue(for: unitType)
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
            
            UserDefaultsHelper.setUnit(for: unitType, units: units, unit: fromUnit, fromUnit: true)
        }
    }
    
    @Published var toUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                fromUnit = oldValue
            }
            
            UserDefaultsHelper.setUnit(for: unitType, units: units, unit: toUnit, fromUnit: false)
        }
    }
    
    @Published var fromValue: String {
        didSet {
            UserDefaultsHelper.setValue(for: unitType, value: fromValue)
        }
    }
    
    var toValue: Double {
        let temp = Measurement(value: Double(fromValue) ?? 0.0, unit: fromUnit.unit)
        let roundAmount = unitType == .currency ? 2 : 4
        return temp.converted(to: toUnit.unit).value.rounded(roundAmount)
    }
    
    // MARK: - INITIALIZERS

    init() {
        let unitType = UserDefaultsHelper.getUnitType()
        self.unitType = unitType
        self.units = UnitAPI.getUnits(for: unitType)
        self.fromUnit = UserDefaultsHelper.getUnit(for: unitType, fromUnit: true)
        self.toUnit = UserDefaultsHelper.getUnit(for: unitType, fromUnit: false)
        self.fromValue = UserDefaultsHelper.getValue(for: unitType)
    }
    
    // MARK: - METHODS
    
    func updateCurrencies() async {
        units = await CurrenciesService.shared.fetchCurrencies()
        fromUnit = UserDefaultsHelper.getUnitCurrency(units: units, fromUnit: true)
        toUnit = UserDefaultsHelper.getUnitCurrency(units: units, fromUnit: false)
    }
        
    func swapUnits() {
        swap(&fromUnit, &toUnit)
    }
}
