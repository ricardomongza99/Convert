//
//  UserDefaultsHelper.swift
//  Convert
//
//  Created by Ricardo Montemayor on 12/03/22.
//

import Foundation

final class UserDefaultsHelper {
    
    static func setUnitType(unitType: UnitType) {
        UserDefaults.standard.set(unitType.rawValue, forKey: "unitType")
    }
    
    static func getUnitType() -> UnitType {
        return UnitType(rawValue: UserDefaults.standard.string(forKey: "unitType") ?? "mass")!
    }
    
    static func setUnit(unitType: UnitType, unit: Unit, fromUnit: Bool) {
        let units = UnitAPI.getUnits(for: unitType)
        let index = units.firstIndex(of: unit)
        let prefix = fromUnit ? "from" : "to"
        UserDefaults.standard.set(index, forKey: "\(unitType.rawValue).\(prefix)UnitIndex")
    }

    static func getUnit(unitType: UnitType, fromUnit: Bool) -> Unit {
        let prefix = fromUnit ? "from" : "to"
        let defaultIndex = fromUnit ? 0 : 1
        let index = UserDefaults.standard.object(forKey: "\(unitType.rawValue).\(prefix)UnitIndex") as? Int ?? defaultIndex
        return UnitAPI.getUnits(for: unitType)[index]
    }
}
