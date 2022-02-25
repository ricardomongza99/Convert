//
//  UnitTypeButton.swift
//  Convert
//
//  Created by Ricardo Montemayor on 22/02/22.
//

import SwiftUI

struct UnitTypeButton: View {
    
    var unitType: UnitType
    var isSelected: Bool
    var changeUnits: (_ unitType: UnitType) -> Void
    
    var body: some View {
        Button {
            changeUnits(unitType)
        } label: {
            Text(unitType.rawValue)
                .font(.callout)
                .padding()
                .foregroundColor(isSelected ? .white : .primaryColor)
                .background(isSelected ? Color.lightGray : Color.white)
                .clipShape(Capsule(style: .continuous))
                .shadow(color: .lightGray, radius: 8.0, x: 0, y: 0)
        }

    }
}

struct UnitTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        UnitTypeButton(unitType: .length, isSelected: true) { _ in }
    }
}
