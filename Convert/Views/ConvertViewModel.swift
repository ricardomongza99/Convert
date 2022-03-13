//
//  ModelData.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import SwiftUI
import Combine

final class ConvertViewModel: ObservableObject {
    
    /// The current `UnitType`
    @Published var unitType: UnitType {
        didSet {
            UserDefaultsHelper.setUnitType(unitType: unitType)
            
            // Update values for `fromUnit` and `toUnit`
            fromUnit = UserDefaultsHelper.getUnit(unitType: unitType, fromUnit: true)
            toUnit = UserDefaultsHelper.getUnit(unitType: unitType, fromUnit: false)
        }
    }
    
    let unitTypes: [UnitType] = UnitAPI.getUnitTypes()

    /// A `Unit` array of the currently selected `unitType`
    var units: [Unit] {
        UnitAPI.getUnits(for: unitType)
    }
    
    @Published var fromUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                toUnit = oldValue
            }
            
            UserDefaultsHelper.setUnit(unitType: unitType, unit: fromUnit, fromUnit: true)
        }
    }
    
    @Published var toUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                fromUnit = oldValue
            }
            
            UserDefaultsHelper.setUnit(unitType: unitType, unit: toUnit, fromUnit: false)
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
        
        self.fromUnit = UserDefaultsHelper.getUnit(unitType: unitType, fromUnit: true)
        self.toUnit = UserDefaultsHelper.getUnit(unitType: unitType, fromUnit: false)
    }
    
    
    private func fetchCurrencies() {
        guard let url = URL(string: "https://api.frankfurter.app/latest") else { return }
        print("Fetching currency rates...")
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Could not fetch latest currency data: \(error)")
            }
            print("Fetched")

            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
                if var rates = json["rates"] as? [String: Double] {
                    rates["EUR"] = 1
                    var currencyUnits = [Unit]()
                    for (key, value) in rates.sorted(by: { $0.0 < $1.0 }) {
                        let unit = UnitCurrency(symbol: key, value: value)
                        currencyUnits.append(Unit(name: "\(CurrencyFlag.dict[key] ?? "") \(key)", unit: unit))
                    }
                    
                    DispatchQueue.main.async {
                        if self.unitType == .currency {
                            // TODO: User Defaults
                            //self.units = currencyUnits
                            self.fromUnit = self.units[0]
                            self.toUnit = self.units[2]
                        }
                    }
                }
            }
        }
        .resume()
    }
        
    func swapUnits() {
        swap(&fromUnit, &toUnit)
    }

}