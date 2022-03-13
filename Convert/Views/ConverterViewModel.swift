//
//  ModelData.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import SwiftUI
import Combine

final class ConverterViewModel: ObservableObject {
    
    /// The current `UnitType`
    @Published var unitType: UnitType {
        didSet {
            UserDefaults.standard.set(unitType.rawValue, forKey: "unitType")
            
            // Update `fromUnit` and `toUnit`
            if unitType != .currency {
//                let fromUnitIndex = UserDefaults.standard.integer(forKey: "\(unitType.rawValue).fromUnitIndex")
//                fromUnit = units[fromUnitIndex]
//
//                let toUnitIndex = UserDefaults.standard.integer(forKey: "\(unitType.rawValue).toUnitIndex")
//                toUnit = units[toUnitIndex]
                
                fromUnit = units[0]
                toUnit = units[2]
            }
        }
    }
    
    let unitTypes: [UnitType] = [.length, .area, .volume, .mass, .currency, .temperature, .storage, .time, .angle]

    /// A `Unit` array of the currently selected `unitType`
    var units: [Unit] {
        UnitAPI.getUnits(forUnitType: unitType)
    }
    
    @Published var fromUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                toUnit = oldValue
            }
            
            //let index = units.firstIndex(of: fromUnit)
            //UserDefaults.standard.set(index, forKey: "\(unitType.rawValue).fromUnitIndex")
        }
    }
    
    @Published var toUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                fromUnit = oldValue
            }
            
            //let index = units.firstIndex(of: toUnit)
            //UserDefaults.standard.set(index, forKey: "\(unitType.rawValue).toUnitIndex")
        }
    }
    
    @Published var fromValue: Double = 0
    
    var toValue: Double {
        let temp = Measurement(value: fromValue, unit: fromUnit.unit)
        let roundAmount = unitType == .currency ? 2 : 4
        return temp.converted(to: toUnit.unit).value.rounded(roundAmount)
    }

    init() {
        let unitType = UnitType(rawValue: UserDefaults.standard.string(forKey: "unitType") ?? "mass")!
        self.unitType = unitType
        
        self.fromUnit = UnitAPI.getUnits(forUnitType: unitType)[0]
        self.toUnit = UnitAPI.getUnits(forUnitType: unitType)[2]
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
