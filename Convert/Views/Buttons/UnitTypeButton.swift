//
//  UnitTypeButton.swift
//  Convert
//
//  Created by Ricardo Montemayor on 22/02/22.
//

import SwiftUI

struct UnitTypeButton: View {
    var unitType: UnitType
    
    var body: some View {
        Button {
            
        } label: {
            Text(unitType.rawValue)
                .font(.callout)
                .frame(width: 80, height: 40)
                .foregroundColor(.primaryColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .stroke(Color.primaryColor, lineWidth: 2)
                )
        }

    }
}

struct UnitTypeButton_Previews: PreviewProvider {
    static var previews: some View {
        UnitTypeButton(unitType: .currency)
    }
}
