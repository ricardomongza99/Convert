//
//  Units.swift
//  Convert
//
//  Created by Ricardo Montemayor on 20/02/22.
//

import Foundation

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

struct Unit: Hashable {
    var name: String
    var unit: Dimension
}

class UnitAPI {
    
    static func getUnits(for unitType: UnitType) -> [Unit] {
        switch unitType {
        case .length:
            return lengthUnits
        case .area:
            return areaUnits
        case .volume:
            return volumeUnits
        case .mass:
            return massUnits
        case .currency:
            return []
        case .temperature:
            return temperatureUnits
        case .storage:
            return storageUnits
        case .time:
            return timeUnits
        case .angle:
            return angleUnits
        }
    }
    
    static private let lengthUnits = [Unit(name: "kilometers", unit: UnitLength.kilometers),
                                      Unit(name: "meters", unit: UnitLength.meters),
                                      Unit(name: "centimeters", unit: UnitLength.centimeters),
                                      Unit(name: "millimeters", unit: UnitLength.millimeters),
                                      Unit(name: "inches", unit: UnitLength.inches),
                                      Unit(name: "feet", unit: UnitLength.feet),
                                      Unit(name: "yards", unit: UnitLength.yards),
                                      Unit(name: "miles", unit: UnitLength.miles)]
    
    
    static private let areaUnits = [Unit(name: "square_kilometers", unit: UnitArea.squareKilometers),
                                    Unit(name: "square_meters", unit: UnitArea.squareMeters),
                                    Unit(name: "square_centimeters", unit: UnitArea.squareCentimeters),
                                    Unit(name: "square_millimeters", unit: UnitArea.squareMillimeters),
                                    Unit(name: "square_inches", unit: UnitArea.squareInches),
                                    Unit(name: "square_feet", unit: UnitArea.squareFeet),
                                    Unit(name: "square_yards", unit: UnitArea.squareYards),
                                    Unit(name: "square_miles", unit: UnitArea.squareMiles),
                                    Unit(name: "acres", unit: UnitArea.acres),
                                    Unit(name: "hectares", unit: UnitArea.hectares)]
    
    static private let volumeUnits = [Unit(name: "liters", unit: UnitVolume.liters),
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
                                      Unit(name: "gallons", unit: UnitVolume.gallons)]
                                      
    static private let massUnits = [Unit(name: "tons", unit: UnitMass.metricTons),
                                    Unit(name: "kilograms", unit: UnitMass.kilograms),
                                    Unit(name: "grams", unit: UnitMass.grams),
                                    Unit(name: "milligrams", unit: UnitMass.milligrams),
                                    Unit(name: "ounces", unit: UnitMass.ounces),
                                    Unit(name: "pounds", unit: UnitMass.pounds)]

    
    static private let temperatureUnits = [Unit(name: "kelvin", unit: UnitTemperature.kelvin),
                                           Unit(name: "celsius", unit: UnitTemperature.celsius),
                                           Unit(name: "fahrenheit", unit: UnitTemperature.fahrenheit)]
    
    static private let storageUnits = [Unit(name: "bits", unit: UnitInformationStorage.bits),
                                       Unit(name: "bytes", unit: UnitInformationStorage.bytes),
                                       Unit(name: "kilobytes", unit: UnitInformationStorage.kilobytes),
                                       Unit(name: "megabytes", unit: UnitInformationStorage.megabytes),
                                       Unit(name: "gigabytes", unit: UnitInformationStorage.gigabytes),
                                       Unit(name: "terabytes", unit: UnitInformationStorage.terabytes),
                                       Unit(name: "petabytes", unit: UnitInformationStorage.petabytes)]

    static private let timeUnits = [Unit(name: "nanoseconds", unit: UnitDuration.nanoseconds),
                                    Unit(name: "microseconds", unit: UnitDuration.microseconds),
                                    Unit(name: "milliseconds", unit: UnitDuration.milliseconds),
                                    Unit(name: "seconds", unit: UnitDuration.seconds),
                                    Unit(name: "minutes", unit: UnitDuration.minutes),
                                    Unit(name: "hours", unit: UnitDuration.hours)]
    
    static private let angleUnits = [Unit(name: "degrees", unit: UnitAngle.degrees),
                                     Unit(name: "arc_minutes", unit: UnitAngle.arcMinutes),
                                     Unit(name: "arc_seconds", unit: UnitAngle.arcSeconds),
                                     Unit(name: "radians", unit: UnitAngle.radians),
                                     Unit(name: "gradians", unit: UnitAngle.gradians),
                                     Unit(name: "revolutions", unit: UnitAngle.revolutions)]
}
