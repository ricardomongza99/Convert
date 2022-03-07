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
            Unit(name: "kilometers", unit: UnitLength.kilometers),
            Unit(name: "meters", unit: UnitLength.meters),
            Unit(name: "centimeters", unit: UnitLength.centimeters),
            Unit(name: "millimeters", unit: UnitLength.millimeters),
            Unit(name: "inches", unit: UnitLength.inches),
            Unit(name: "feet", unit: UnitLength.feet),
            Unit(name: "yards", unit: UnitLength.yards),
            Unit(name: "miles", unit: UnitLength.miles)
        ]
    }
    
    static func getAreaUnits() -> [Unit] {
        return [
            Unit(name: "square_kilometers", unit: UnitArea.squareKilometers),
            Unit(name: "square_meters", unit: UnitArea.squareMeters),
            Unit(name: "square_centimeters", unit: UnitArea.squareCentimeters),
            Unit(name: "square_millimeters", unit: UnitArea.squareMillimeters),
            Unit(name: "square_inches", unit: UnitArea.squareInches),
            Unit(name: "square_feet", unit: UnitArea.squareFeet),
            Unit(name: "square_yards", unit: UnitArea.squareYards),
            Unit(name: "square_miles", unit: UnitArea.squareMiles),
            Unit(name: "acres", unit: UnitArea.acres),
            Unit(name: "hectares", unit: UnitArea.hectares)
        ]
    }
    
    static func getVolumeUnits() -> [Unit] {
        return [
            Unit(name: "liters", unit: UnitVolume.liters),
            Unit(name: "milliliters", unit: UnitVolume.milliliters),
            Unit(name: "cubic_meters", unit: UnitVolume.cubicMeters),
            Unit(name: "cubic_inches", unit: UnitVolume.cubicInches),
            Unit(name: "cubic_feet", unit: UnitVolume.cubicFeet),
            Unit(name: "teaspoons", unit: UnitVolume.teaspoons),
            Unit(name: "tablespoons", unit: UnitVolume.tablespoons),
            Unit(name: "fluid_ounces", unit: UnitVolume.fluidOunces),
            Unit(name: "cups", unit: UnitVolume.cups),
            Unit(name: "pints", unit: UnitVolume.pints),
            Unit(name: "quarts", unit: UnitVolume.quarts),
            Unit(name: "gallons", unit: UnitVolume.gallons)
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
