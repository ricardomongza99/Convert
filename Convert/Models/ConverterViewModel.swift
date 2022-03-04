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
        let roundAmount = currentUnitType == .currency ? 2 : 4
        return temp.converted(to: toUnit.unit).value.rounded(roundAmount)
    }
    
    @Published var currentUnits = [Unit]()

    @Published var currentUnitType: UnitType = .mass {
        didSet {
            if oldValue == currentUnitType { return }
            
            switch currentUnitType {
            case .length:
                currentUnits = lengthUnits
            case .volume:
                currentUnits = volumeUnits
            case .area:
                currentUnits = areaUnits
            case .temperature:
                currentUnits = temperatureUnits
            case .currency:
                fetchCurrencies()
            case .mass:
                currentUnits = massUnits
            case .storage:
                currentUnits = storageUnits
            case .time:
                currentUnits = timeUnits
            case .angle:
                currentUnits = angleUnits
            }
            
            // TODO: Change indexes
            if currentUnitType != .currency {
                fromUnit = currentUnits[0]
                toUnit = currentUnits[2]
            }
        }
    }
    
    enum UnitType: String {
        case length = "📏 Length"
        case area = "🖼 Area"
        case volume = "💧 Volume"
        case mass = "⚖️ Mass"
        case currency = "💵 Currency"
        case temperature = "🌡 Temp."
        case storage = "💾 Storage"
        case time = "⏱ Time"
        case angle = "📐 Angle"
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
        self.currentUnits = massUnits
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
                        if self.currentUnitType == .currency {
                            // TODO: User Defaults
                            self.currentUnits = self.currencyUnits
                            self.fromUnit = self.currentUnits[0]
                            self.toUnit = self.currentUnits[2]
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
