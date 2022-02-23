//
//  UnitTypesView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 23/02/22.
//

import SwiftUI

struct UnitTypesView: View {
    
    var currentUnitType: UnitType
    var unitTypes: [UnitType]
    var changeUnits: (_ unitType: UnitType) -> Void

    var body: some View {
        VStack {
            HStack {
                ForEach(0..<4) { i in
                    UnitTypeButton(
                        unitType: unitTypes[i],
                        isSelected: currentUnitType == unitTypes[i],
                        changeUnits: changeUnits
                    )
                }
            }
            
            HStack {
                ForEach(4..<8) { i in
                    UnitTypeButton(
                        unitType: unitTypes[i],
                        isSelected: currentUnitType == unitTypes[i],
                        changeUnits: changeUnits
                    )
                }
            }
        }
    }
}

struct UnitTypesView_Previews: PreviewProvider {
    static let unitTypes = ViewModel().unitTypes
    static var previews: some View {
        UnitTypesView(currentUnitType: .mass, unitTypes: unitTypes) { _ in }
    }
}
