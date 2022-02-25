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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(unitTypes, id: \.self) { unitType in
                    UnitTypeButton(
                        unitType: unitType,
                        isSelected: currentUnitType == unitType,
                        changeUnits: changeUnits
                    )
                }
            }
            .padding()
        }
    }
}

struct UnitTypesView_Previews: PreviewProvider {
    static let unitTypes = ViewModel().unitTypes
    static var previews: some View {
        UnitTypesView(currentUnitType: .mass, unitTypes: unitTypes) { _ in }
    }
}
