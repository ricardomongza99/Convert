//
//  ModelData.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import SwiftUI
import Combine

final class ConverterViewModel: ObservableObject {
    
    @Published var fromUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                toUnit = oldValue
            }
        }
    }
    
    @Published var toUnit: Unit {
        didSet {
            if fromUnit == toUnit {
                fromUnit = oldValue
            }
        }
    }
    
    @Published var fromValue: Double = 0
    
    var toValue: Double {
        let temp = Measurement(value: fromValue, unit: fromUnit.unit)
        let roundAmount = unitType == .currency ? 2 : 4
        return temp.converted(to: toUnit.unit).value.rounded(roundAmount)
    }
    
    enum UnitType: String {
        case length
        case area
        case volume
        case mass
        case currency
        case temperature
        case storage
        case time
        case angle
    }
    
    /// The current `UnitType`
    @Published var unitType: UnitType {
        didSet {
            UserDefaults.standard.set(unitType.rawValue, forKey: "unitType")
        }
    }
    
    let unitTypes: [UnitType] = [.length, .area, .volume, .mass, .currency, .temperature, .storage, .time, .angle]

    /// A `Unit` array of the currently selected `unitType`
    var units: [Unit] {
        switch unitType {
        case .length:
            return UnitAPI.getLengthUnits()
        case .volume:
            return UnitAPI.getVolumeUnits()
        case .area:
            return UnitAPI.getAreaUnits()
        case .temperature:
            return UnitAPI.getTemperatureUnits()
        case .currency:
            // TODO: Fetch currencies
            return []
        case .mass:
            return UnitAPI.getMassUnits()
        case .storage:
            return UnitAPI.getStorageUnits()
        case .time:
            return UnitAPI.getTimeUnits()
        case .angle:
            return UnitAPI.getAngleUnits()
        }
    }

    init() {
        self.unitType = UnitType(rawValue: UserDefaults.standard.string(forKey: "unitType") ?? "mass")!
        // TODO: User Defaults
        self.fromUnit = UnitAPI.getMassUnits()[0]
        self.toUnit = UnitAPI.getMassUnits()[2]
    }
    
    /// Updated `unitType`, `units` and gets `fromUnit` and `toUnit` from UserDefaults
    func changeUnitType(unitType: UnitType) {
        self.unitType = unitType
        
        // TODO: Change indexes
        if unitType != .currency {
            fromUnit = units[0]
            toUnit = units[2]
        }
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
