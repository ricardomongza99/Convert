//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ContentView: View {

    @State private var units = ConverterViewModel().massUnits

    @State private var fromUnit = ConverterViewModel().massUnits[1]
    @State private var toUnit = ConverterViewModel().massUnits[5]
    
    private let unitTypes = ConverterViewModel().unitTypes
            
    @State private var currentUnitType: UnitType = .mass
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            ConverterView(fromUnit: $fromUnit, toUnit: $toUnit)
            
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
            

            UnitsPicker(
                units: $units,
                fromUnit: $fromUnit,
                toUnit: $toUnit
            )
            
            Spacer()
        }
    }
    
    /// Changes `currentUnitType` and its Pickers
    func changeUnits(unitType: UnitType) {
        currentUnitType = unitType
        
        switch unitType {
        case .length:
            units = ConverterViewModel().lengthUnits
        case .volume:
            units = ConverterViewModel().volumeUnits
        case .area:
            units = ConverterViewModel().areaUnits
        case .temperature:
            units = ConverterViewModel().temperatureUnits
        case .currency:
            units = ConverterViewModel().lengthUnits
        case .mass:
            units = ConverterViewModel().massUnits
        case .storage:
            units = ConverterViewModel().storageUnits
        case .time:
            units = ConverterViewModel().timeUnits
        }
        
        fromUnit = units[0]
        toUnit = units[1]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
