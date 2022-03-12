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
    
    /// A `Unit` array of the currently selected `unitType`
    @Published var units: [Unit]

    /// The current `UnitType`
    @Published var unitType: UnitType = .mass {
        didSet {
            if oldValue == unitType { return }
            
            switch unitType {
            case .length:
                units = lengthUnits
            case .volume:
                units = volumeUnits
            case .area:
                units = areaUnits
            case .temperature:
                units = temperatureUnits
            case .currency:
                fetchCurrencies()
            case .mass:
                units = massUnits
            case .storage:
                units = storageUnits
            case .time:
                units = timeUnits
            case .angle:
                units = angleUnits
            }
            
            // TODO: Change indexes
            if unitType != .currency {
                fromUnit = units[0]
                toUnit = units[2]
            }
        }
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
    
    let unitTypes: [UnitType] = [.length, .area, .volume, .mass, .currency, .temperature, .storage, .time, .angle]
    
    let lengthUnits: [Unit] = UnitAPI.getLengthUnits()
    
    let areaUnits: [Unit] = UnitAPI.getAreaUnits()
    
    let volumeUnits: [Unit] = UnitAPI.getVolumeUnits()
    
    let massUnits: [Unit] = UnitAPI.getMassUnits()

    let temperatureUnits: [Unit] = UnitAPI.getTemperatureUnits()

    let storageUnits: [Unit] = UnitAPI.getStorageUnits()
    
    let timeUnits: [Unit] = UnitAPI.getTimeUnits()
    
    let angleUnits: [Unit] = UnitAPI.getAngleUnits()
    
    var currencyUnits: [Unit] = []
        
    init() {
        // TODO: User Defaults
        self.units = massUnits
        self.fromUnit = massUnits[0]
        self.toUnit = massUnits[1]
    }
    
    private func fetchCurrencies() {
        guard let url = URL(string: "https://api.frankfurter.app/latest") else { return }
        currencyUnits = []
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
                    for (key, value) in rates.sorted(by: { $0.0 < $1.0 }) {
                        let unit = UnitCurrency(symbol: key, value: value)
                        self.currencyUnits.append(Unit(name: "\(CurrencyFlag.dict[key] ?? "") \(key)", unit: unit))
                    }
                    
                    DispatchQueue.main.async {
                        if self.unitType == .currency {
                            // TODO: User Defaults
                            self.units = self.currencyUnits
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
