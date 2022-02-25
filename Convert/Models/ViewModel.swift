//
//  ModelData.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import Foundation

final class ViewModel {
    let unitTypes: [UnitType] = [.length, .area, .volume, .mass, .currency, .temperature, .storage, .time]
    
    let lengthUnits: [Unit] = [
        Unit(name: "Kilometers", symbol: "km", unit: UnitLength.kilometers),
        Unit(name: "Meters", symbol: "m", unit: UnitLength.meters),
        Unit(name: "Centimeters", symbol: "cm", unit: UnitLength.centimeters),
        Unit(name: "Millimeters", symbol: "mm", unit: UnitLength.millimeters),
        Unit(name: "Inches", symbol: "in", unit: UnitLength.inches),
        Unit(name: "Feet", symbol: "ft", unit: UnitLength.feet),
        Unit(name: "Yards", symbol: "yd", unit: UnitLength.yards),
        Unit(name: "Miles", symbol: "mi", unit: UnitLength.miles)
    ]
    
    let volumeUnits: [Unit] = [
        Unit(name: "Liters", symbol: "L", unit: UnitVolume.liters),
        Unit(name: "Milliliters", symbol: "mL", unit: UnitVolume.milliliters),
        Unit(name: "Cubic Meters", symbol: "m³", unit: UnitVolume.cubicMeters),
        Unit(name: "Cubic Inches", symbol: "in³", unit: UnitVolume.cubicInches),
        Unit(name: "Cubic Feet", symbol: "ft³", unit: UnitVolume.cubicFeet),
        Unit(name: "Teaspoons", symbol: "tsp", unit: UnitVolume.teaspoons),
        Unit(name: "Tablespoons", symbol: "tbsp", unit: UnitVolume.tablespoons),
        Unit(name: "Fluid Ounces", symbol: "fl oz", unit: UnitVolume.fluidOunces),
        Unit(name: "Cups", symbol: "cup", unit: UnitVolume.cups),
        Unit(name: "Pints", symbol: "pt", unit: UnitVolume.pints),
        Unit(name: "Quarts", symbol: "qt", unit: UnitVolume.quarts),
        Unit(name: "Gallon", symbol: "gal", unit: UnitVolume.gallons)
    ]
    
    let areaUnits: [Unit] = [
        Unit(name: "Square Kilometers", symbol: "km²", unit: UnitArea.squareKilometers),
        Unit(name: "Square Meters", symbol: "m²", unit: UnitArea.squareMeters),
        Unit(name: "Square Centimeters", symbol: "cm²", unit: UnitArea.squareCentimeters),
        Unit(name: "Square Millimeters", symbol: "mm²", unit: UnitArea.squareMillimeters),
        Unit(name: "Square Inches", symbol: "in²", unit: UnitArea.squareInches),
        Unit(name: "Square Feet", symbol: "ft²", unit: UnitArea.squareFeet),
        Unit(name: "Square Yards", symbol: "yd²", unit: UnitArea.squareYards),
        Unit(name: "Square Miles", symbol: "mi²", unit: UnitArea.squareMiles),
        Unit(name: "Acres", symbol: "ac", unit: UnitArea.acres),
        Unit(name: "Hectares", symbol: "ha", unit: UnitArea.hectares)
    ]
    
    let temperatureUnits: [Unit] = [
        Unit(name: "Kelvin", symbol: "K", unit: UnitTemperature.kelvin),
        Unit(name: "Celsius", symbol: "°C", unit: UnitTemperature.celsius),
        Unit(name: "Fahrenheit", symbol: "°F", unit: UnitTemperature.fahrenheit)
    ]
    
    let massUnits: [Unit] = [
        Unit(name: "Tons", symbol: "t", unit: UnitMass.metricTons),
        Unit(name: "Kilograms", symbol: "kg", unit: UnitMass.kilograms),
        Unit(name: "Grams", symbol: "g", unit: UnitMass.grams),
        Unit(name: "Milligrams", symbol: "mg", unit: UnitMass.milligrams),
        Unit(name: "Ounces", symbol: "oz", unit: UnitMass.ounces),
        Unit(name: "Pounds", symbol: "lb", unit: UnitMass.pounds),
    ]
    
    let storageUnits: [Unit] = [
        Unit(name: "Bits", symbol: "b", unit: UnitInformationStorage.bits),
        Unit(name: "Bytes", symbol: "B", unit: UnitInformationStorage.bytes),
        Unit(name: "Kilobytes", symbol: "KB", unit: UnitInformationStorage.kilobytes),
        Unit(name: "Megabytes", symbol: "MB", unit: UnitInformationStorage.megabytes),
        Unit(name: "Gigabytes", symbol: "GB", unit: UnitInformationStorage.gigabytes),
        Unit(name: "Terabytes", symbol: "TB", unit: UnitInformationStorage.terabytes),
        Unit(name: "Petabytes", symbol: "PB", unit: UnitInformationStorage.petabytes)
    ]
    
    let timeUnits: [Unit] = [
        Unit(name: "Nanosecond", symbol: "ns", unit: UnitDuration.nanoseconds),
        Unit(name: "Microseconds", symbol: "μs", unit: UnitDuration.microseconds),
        Unit(name: "Milliseconds", symbol: "ms", unit: UnitDuration.milliseconds),
        Unit(name: "Seconds", symbol: "sec", unit: UnitDuration.seconds),
        Unit(name: "Minutes", symbol: "min", unit: UnitDuration.minutes),
        Unit(name: "Hours", symbol: "hr", unit: UnitDuration.hours),
    ]
    
    let currencyUnits: [Unit] = [
        Unit(name: "Mexican Peso", symbol: "MXN", unit: UnitCurrency.mexicanPeso),
        Unit(name: "United States Dollar", symbol: "USD", unit: UnitCurrency.unitedStatesDollar),
        Unit(name: "Euro", symbol: "EUR", unit: UnitCurrency.euro)
    ]
}
