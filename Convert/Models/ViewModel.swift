//
//  ModelData.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import SwiftUI
import Combine

final class ViewModel: ObservableObject {
    
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
    
    @Published var currentUnits = [Unit]()

    @Published var currentUnitType: UnitType = .mass {
        didSet {
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
                currentUnits = currencyUnits
            case .mass:
                currentUnits = massUnits
            case .storage:
                currentUnits = storageUnits
            case .time:
                currentUnits = timeUnits
            }
            
            // TODO: Change indexes
            if currentUnits.count > 2 {
                fromUnit = currentUnits[0]
                toUnit = currentUnits[2]
            }
        }
    }
    
    let unitTypes: [UnitType] = [.length, .area, .volume, .mass, .currency, .temperature, .storage, .time]
    
    let lengthUnits: [Unit] = [
        Unit(name: "Kilometers", unit: UnitLength.kilometers),
        Unit(name: "Meters", unit: UnitLength.meters),
        Unit(name: "Centimeters", unit: UnitLength.centimeters),
        Unit(name: "Millimeters", unit: UnitLength.millimeters),
        Unit(name: "Inches", unit: UnitLength.inches),
        Unit(name: "Feet", unit: UnitLength.feet),
        Unit(name: "Yards", unit: UnitLength.yards),
        Unit(name: "Miles", unit: UnitLength.miles)
    ]
    
    let volumeUnits: [Unit] = [
        Unit(name: "Liters", unit: UnitVolume.liters),
        Unit(name: "Milliliters", unit: UnitVolume.milliliters),
        Unit(name: "Cubic Meters", unit: UnitVolume.cubicMeters),
        Unit(name: "Cubic Inches", unit: UnitVolume.cubicInches),
        Unit(name: "Cubic Feet", unit: UnitVolume.cubicFeet),
        Unit(name: "Teaspoons", unit: UnitVolume.teaspoons),
        Unit(name: "Tablespoons", unit: UnitVolume.tablespoons),
        Unit(name: "Fluid Ounces", unit: UnitVolume.fluidOunces),
        Unit(name: "Cups", unit: UnitVolume.cups),
        Unit(name: "Pints", unit: UnitVolume.pints),
        Unit(name: "Quarts", unit: UnitVolume.quarts),
        Unit(name: "Gallon", unit: UnitVolume.gallons)
    ]
    
    let areaUnits: [Unit] = [
        Unit(name: "Square Kilometers", unit: UnitArea.squareKilometers),
        Unit(name: "Square Meters", unit: UnitArea.squareMeters),
        Unit(name: "Square Centimeters", unit: UnitArea.squareCentimeters),
        Unit(name: "Square Millimeters", unit: UnitArea.squareMillimeters),
        Unit(name: "Square Inches", unit: UnitArea.squareInches),
        Unit(name: "Square Feet", unit: UnitArea.squareFeet),
        Unit(name: "Square Yards", unit: UnitArea.squareYards),
        Unit(name: "Square Miles", unit: UnitArea.squareMiles),
        Unit(name: "Acres", unit: UnitArea.acres),
        Unit(name: "Hectares", unit: UnitArea.hectares)
    ]
    
    let temperatureUnits: [Unit] = [
        Unit(name: "Kelvin", unit: UnitTemperature.kelvin),
        Unit(name: "Celsius", unit: UnitTemperature.celsius),
        Unit(name: "Fahrenheit", unit: UnitTemperature.fahrenheit)
    ]
    
    let massUnits: [Unit] = [
        Unit(name: "Tons", unit: UnitMass.metricTons),
        Unit(name: "Kilograms", unit: UnitMass.kilograms),
        Unit(name: "Grams", unit: UnitMass.grams),
        Unit(name: "Milligrams", unit: UnitMass.milligrams),
        Unit(name: "Ounces", unit: UnitMass.ounces),
        Unit(name: "Pounds", unit: UnitMass.pounds),
    ]
    
    let storageUnits: [Unit] = [
        Unit(name: "Bits", unit: UnitInformationStorage.bits),
        Unit(name: "Bytes", unit: UnitInformationStorage.bytes),
        Unit(name: "Kilobytes", unit: UnitInformationStorage.kilobytes),
        Unit(name: "Megabytes", unit: UnitInformationStorage.megabytes),
        Unit(name: "Gigabytes", unit: UnitInformationStorage.gigabytes),
        Unit(name: "Terabytes", unit: UnitInformationStorage.terabytes),
        Unit(name: "Petabytes", unit: UnitInformationStorage.petabytes)
    ]
    
    let timeUnits: [Unit] = [
        Unit(name: "Nanosecond", unit: UnitDuration.nanoseconds),
        Unit(name: "Microseconds", unit: UnitDuration.microseconds),
        Unit(name: "Milliseconds", unit: UnitDuration.milliseconds),
        Unit(name: "Seconds", unit: UnitDuration.seconds),
        Unit(name: "Minutes", unit: UnitDuration.minutes),
        Unit(name: "Hours", unit: UnitDuration.hours),
    ]
    
    var currencyUnits: [Unit] = [
        Unit(name: "EUR", unit: UnitCurrency.euro)
    ]
    
    init() {
        self.currentUnits = massUnits
        self.fromUnit = massUnits[0]
        self.toUnit = massUnits[1]
    }
    
    private func fetchCurrencies() {
        guard let url = URL(string: "https://api.frankfurter.app/latest") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Could not fetch latest currency data: \(error)")
            }
            
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
                if let rates = json["rates"] as? [String: Double] {
                    var currencies = [Unit]()
                    for (key, value) in rates {
                        let unit = UnitCurrency(symbol: key, converter: UnitConverterLinear(coefficient: 1/value))
                        currencies.append(Unit(name: key, unit: unit))
                    }
                    
                    DispatchQueue.main.async {
                        self.currencyUnits = currencies
                    }
                }
            }
        }
        .resume()
    }
        
    func swapUnits() {
        
    }

}
