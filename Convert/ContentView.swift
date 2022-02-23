//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ContentView: View {

    @State private var units = ModelData().massUnits

    @State private var fromUnit = ModelData().massUnits[1]
    @State private var toUnit = ModelData().massUnits[5]
    
    private let unitTypes = ModelData().unitTypes
            
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
            units = ModelData().lengthUnits
        case .volume:
            units = ModelData().volumeUnits
        case .area:
            units = ModelData().areaUnits
        case .temperature:
            units = ModelData().temperatureUnits
        case .currency:
            units = ModelData().lengthUnits
        case .mass:
            units = ModelData().massUnits
        case .storage:
            units = ModelData().storageUnits
        case .time:
            units = ModelData().timeUnits
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
