//
//  ConverterView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 22/02/22.
//

import SwiftUI

struct ConverterView: View {
    
    @Binding var fromUnit: Unit
    @Binding var toUnit: Unit
    var swapUnits: () -> Void
    
    @State private var fromValue = "0"
    private var toValue: Double {
        if let value = Double(fromValue) {
            let temp = Measurement(value: value, unit: fromUnit.unit)
            return temp.converted(to: toUnit.unit).value.rounded(4)
        } else {
            return 0
        }
    }
    
    var body: some View {
        Section {
            VStack {
                HStack(alignment: .center, spacing: 20){
                    TextField("", text: $fromValue)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .frame(height: 64)
                        .padding([.leading, .trailing], 8)
                        .background(
                            Capsule().fill(Color.white)
                        )
                        .keyboardType(.decimalPad)
                        .onChange(of: fromValue) { [fromValue] newValue in
                            print(newValue)
                        }
                        
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

                    Button(action: swapUnits) {
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
    }
}

struct ConverterView_Previews: PreviewProvider {
    static let massUnits = ViewModel().massUnits
    static var previews: some View {
        ConverterView(
            fromUnit: .constant(massUnits[0]),
            toUnit: .constant(massUnits[4]),
            swapUnits: {}
        )
    }
}
