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
    
    static func setUnitIndex(unitType: UnitType, unit: Unit, fromUnit: Bool) {
        let units = UnitAPI.getUnits(for: unitType)
        let index = units.firstIndex(of: unit)
        let prefix = fromUnit ? "from" : "to"
        UserDefaults.standard.set(index, forKey: "\(unitType.rawValue).\(prefix)UnitIndex")
    }
    
    /**
     Gets index for the current `units` stored in UserDefaults either for `fromUnit` or `toUnit`
     - parameter unitType: the current unit type of `units`
     - parameter fromUnit: true if referring to `fromUnit` or false if referring to `toUnit`
     - returns: the index for the current `units`
     */
    static func getUnitIndex(unitType: UnitType, fromUnit: Bool) -> Int {
        let prefix = fromUnit ? "from" : "to"
        let defaultIndex = fromUnit ? 0 : 1
        return UserDefaults.standard.object(forKey: "\(unitType.rawValue).\(prefix)UnitIndex") as? Int ?? defaultIndex
        
    }

}
