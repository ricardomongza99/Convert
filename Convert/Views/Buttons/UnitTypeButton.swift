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
                .frame(width: 80, height: 40)
                .foregroundColor(isSelected ? .white : .primaryColor)
                .overlay (
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(isSelected ? .clear : Color.primaryColor, lineWidth: 2)
                ).background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isSelected ? Color.primaryColor : .clear)
                )
        }

    }
}

struct UnitTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        UnitTypeButton(unitType: .length, isSelected: true) { _ in }
    }
}
