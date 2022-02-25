//
//  ConverterView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 22/02/22.
//

import SwiftUI

struct ConverterView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var fromValue = "0"
    private var toValue: Double {
        if let value = Double(fromValue) {
            let temp = Measurement(value: value, unit: viewModel.fromUnit.unit)
            return temp.converted(to: viewModel.toUnit.unit).value.rounded(4)
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
                    unitText(text: viewModel.fromUnit.unit.symbol)

                    Button(action: viewModel.swapUnits) {
                        Image("arrows")
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }

                    unitText(text: viewModel.toUnit.unit.symbol)
                }
            }
            .padding()

        }
        .background(Color.primaryColor)
    }
    
    // MARK: - COMPONENTS
    
    @ViewBuilder
    private func unitText(text: String) -> some View {
        Text(text)
            .font(.title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
            .environmentObject(ViewModel())
    }
}
