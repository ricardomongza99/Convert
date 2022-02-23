//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ContentView: View {

    @State private var units = ViewModel().massUnits

    @State private var fromUnit = ViewModel().massUnits[1]
    @State private var toUnit = ViewModel().massUnits[5]
    
    private let unitTypes = ViewModel().unitTypes
            
    @State private var currentUnitType: UnitType = .mass
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            ConverterView(fromUnit: $fromUnit, toUnit: $toUnit)
            
            UnitTypesView(currentUnitType: currentUnitType, unitTypes: unitTypes, changeUnits: changeUnits)

            UnitsPickerView(
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
            units = ViewModel().lengthUnits
        case .volume:
            units = ViewModel().volumeUnits
        case .area:
            units = ViewModel().areaUnits
        case .temperature:
            units = ViewModel().temperatureUnits
        case .currency:
            units = ViewModel().lengthUnits
        case .mass:
            units = ViewModel().massUnits
        case .storage:
            units = ViewModel().storageUnits
        case .time:
            units = ViewModel().timeUnits
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
