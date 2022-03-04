//
//  Units.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import Foundation

struct Unit: Hashable {
    var name: String
    var unit: Dimension
}

class UnitAPI {
    static func getLengthUnits() -> [Unit] {
        return [
            Unit(name: "Kilometers", unit: UnitLength.kilometers),
            Unit(name: "Meters", unit: UnitLength.meters),
            Unit(name: "Centimeters", unit: UnitLength.centimeters),
            Unit(name: "Millimeters", unit: UnitLength.millimeters),
            Unit(name: "Inches", unit: UnitLength.inches),
            Unit(name: "Feet", unit: UnitLength.feet),
            Unit(name: "Yards", unit: UnitLength.yards),
            Unit(name: "Miles", unit: UnitLength.miles)
        ]
    }
    
    static func getAreaUnits() -> [Unit] {
        return [
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
    }
    
    static func getVolumeUnits() -> [Unit] {
        return [
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
    }
    
    
    static func getMassUnits() -> [Unit] {
        return [
            Unit(name: "Tons", unit: UnitMass.metricTons),
            Unit(name: "Kilograms", unit: UnitMass.kilograms),
            Unit(name: "Grams", unit: UnitMass.grams),
            Unit(name: "Milligrams", unit: UnitMass.milligrams),
            Unit(name: "Ounces", unit: UnitMass.ounces),
            Unit(name: "Pounds", unit: UnitMass.pounds),
        ]
    }

    
    static func getTemperatureUnits() -> [Unit] {
        return [
            Unit(name: "Kelvin", unit: UnitTemperature.kelvin),
            Unit(name: "Celsius", unit: UnitTemperature.celsius),
            Unit(name: "Fahrenheit", unit: UnitTemperature.fahrenheit)
        ]
    }

    
    static func getStorageUnits() -> [Unit] {
        [
            Unit(name: "Bits", unit: UnitInformationStorage.bits),
            Unit(name: "Bytes", unit: UnitInformationStorage.bytes),
            Unit(name: "Kilobytes", unit: UnitInformationStorage.kilobytes),
            Unit(name: "Megabytes", unit: UnitInformationStorage.megabytes),
            Unit(name: "Gigabytes", unit: UnitInformationStorage.gigabytes),
            Unit(name: "Terabytes", unit: UnitInformationStorage.terabytes),
            Unit(name: "Petabytes", unit: UnitInformationStorage.petabytes)
        ]
    }
    
    static func getTimeUnits() -> [Unit] {
        return [
            Unit(name: "Nanosecond", unit: UnitDuration.nanoseconds),
            Unit(name: "Microseconds", unit: UnitDuration.microseconds),
            Unit(name: "Milliseconds", unit: UnitDuration.milliseconds),
            Unit(name: "Seconds", unit: UnitDuration.seconds),
            Unit(name: "Minutes", unit: UnitDuration.minutes),
            Unit(name: "Hours", unit: UnitDuration.hours),
        ]
    }
    
    static func getAngleUnits() -> [Unit] {
        return [
            Unit(name: "Degrees", unit: UnitAngle.degrees),
            Unit(name: "Arc Minutes", unit: UnitAngle.arcMinutes),
            Unit(name: "Arc Seconds", unit: UnitAngle.arcSeconds),
            Unit(name: "Radians", unit: UnitAngle.radians),
            Unit(name: "Gradians", unit: UnitAngle.gradians),
            Unit(name: "Revolutions", unit: UnitAngle.revolutions)
        ]
    }
}
