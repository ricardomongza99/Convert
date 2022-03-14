//
//  UserDefaultsHelper.swift
//  Convert
//
//  Created by Ricardo Montemayor on 12/03/22.
//

import Foundation

final class UserDefaultsHelper {
    
    static func setUnitType(for unitType: UnitType) {
        UserDefaults.standard.set(unitType.rawValue, forKey: "unitType")
    }
    
    static func getUnitType() -> UnitType {
        return UnitType(rawValue: UserDefaults.standard.string(forKey: "unitType") ?? "mass")!
    }
    
    
    static func setValue(for unitType: UnitType, value: String) {
        UserDefaults.standard.set(value, forKey: "\(unitType.rawValue).value")
    }
    
    static func getValue(for unitType: UnitType) -> String {
        return UserDefaults.standard.string(forKey: "\(unitType.rawValue).value") ?? "1"
    }
    
    static func setUnit(for unitType: UnitType, units: [Unit], unit: Unit, fromUnit: Bool) {
        let index = units.firstIndex(of: unit)
        let prefix = fromUnit ? "from" : "to"
        UserDefaults.standard.set(index, forKey: "\(unitType.rawValue).\(prefix)UnitIndex")
    }

    static func getUnit(for unitType: UnitType, fromUnit: Bool) -> Unit {
        let prefix = fromUnit ? "from" : "to"
        let defaultIndex = fromUnit ? 0 : 1
        let index = UserDefaults.standard.object(forKey: "\(unitType.rawValue).\(prefix)UnitIndex") as? Int ?? defaultIndex
        return UnitAPI.getUnits(for: unitType)[index]
    }
    
    static func getUnitCurrency(units: [Unit], fromUnit: Bool) -> Unit {
        let prefix = fromUnit ? "from" : "to"
        let defaultIndex = fromUnit ? 30 : 19
        let index = UserDefaults.standard.object(forKey: "\(UnitType.currency.rawValue).\(prefix)UnitIndex") as? Int ?? defaultIndex
        return units[index]
    }

}
