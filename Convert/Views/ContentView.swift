//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fromValue = 0.0
    private var toValue: Double {
        let temp = Measurement(value: fromValue, unit: fromUnit.unit)
        return temp.converted(to: toUnit.unit).value.rounded(4)
    }
    
    @State private var units = ModelData().massUnits

    @State private var fromUnit = ModelData().massUnits[1]
    @State private var toUnit = ModelData().massUnits[5]
    
    private let unitTypes = ModelData().unitTypes
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Section {
                VStack {
                    HStack(alignment: .center, spacing: 20){
                        TextField("", value: $fromValue, format: .number)
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .frame(height: 64)
                            .padding([.leading, .trailing], 8)
                            .background(
                                Capsule().fill(Color.white)
                            )
                            .keyboardType(.decimalPad)
                            
                        Text("=")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()

                        Text(toValue, format: .number)
                            .font(.title)
                            .frame(height: 64)
                            .frame(maxWidth: .infinity)
                            .padding([.leading, .trailing], 8)
                            .background(
                                Capsule().fill(Color.white)
                            )

                    }
                    
                    HStack(alignment: .top, spacing: 0) {
                        Text(fromUnit.symbol)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)

                        Button {
                            
                        } label: {
                            Image("arrows")
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }

                        Text(toUnit.symbol)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()

            }
            .background(Color.primaryColor)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    ForEach(0..<4) { i in
                        Button(unitTypes[i].rawValue) {
                            
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    ForEach(4..<8) { i in
                        Button(unitTypes[i].rawValue) {
                            
                        }
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
