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
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            ConverterView(fromUnit: $fromUnit, toUnit: $toUnit)
            
            VStack {
                HStack {
                    ForEach(0..<4) { i in
                        UnitTypeButton(unitType: unitTypes[i])
                    }
                }
                
                HStack {
                    ForEach(4..<8) { i in
                        UnitTypeButton(unitType: unitTypes[i])
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
