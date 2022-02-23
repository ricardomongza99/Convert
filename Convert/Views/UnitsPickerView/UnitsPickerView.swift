//
//  UnitsPicker.swift
//  Convert
//
//  Created by Ricardo Montemayor on 21/02/22.
//

import SwiftUI

struct UnitsPickerView: View {
    @Binding var units: [Unit]
    @Binding var fromUnit: Unit
    @Binding var toUnit: Unit
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Picker("From", selection: $fromUnit) {
                    ForEach(units, id: \.self) {
                        Text($0.name)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: geometry.size.width / 2)
                .clipped()
                .animation(.easeInOut, value: fromUnit)
                .onChange(of: fromUnit) { [fromUnit] newValue in
                    if newValue == toUnit {
                        toUnit = fromUnit
                    }
                }
                
                Divider()
                
                Picker("To", selection: $toUnit) {
                    ForEach(units, id: \.self) {
                        Text($0.name)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: geometry.size.width / 2)
                .clipped()
                .animation(.easeInOut, value: toUnit)
                .onChange(of: toUnit) { [toUnit] newValue in
                    if newValue == fromUnit {
                        fromUnit = toUnit
                    }
                }

            }
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.lightGray, lineWidth: 1)
            )
            .background(Color.white)
            .cornerRadius(40)
            .shadow(color: .lightGray, radius: 8.0, x: 0, y: 0)

        }
        .padding([.leading, .trailing])
        .frame(height: 250)
    }
}

struct UnitsPickerView_Previews: PreviewProvider {
    static let massUnits = ViewModel().massUnits
    static var previews: some View {
        UnitsPickerView(
            units: .constant(massUnits),
            fromUnit: .constant(massUnits[0]),
            toUnit: .constant(massUnits[4])
        )
    }
}
