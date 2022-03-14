//
//  ConverterView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 12/03/22.
//

import SwiftUI

struct ConverterView: View {
    @EnvironmentObject var viewModel: ConvertViewModel

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 20) {
                TextField("", value: $viewModel.fromValue, format: .number)
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

                Text(viewModel.toValue, format: .number)
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

                // TODO: Figure out why it does not work with @MainActor
//                Button(action: viewModel.swapUnits) {
//                    Image("arrows")
//                        .aspectRatio(1, contentMode: .fit)
//                        .frame(width: 40, height: 40)
//                }

                unitText(text: viewModel.toUnit.unit.symbol)
            }
        }
        .padding()
        .background(Color.primaryColor)
    }
    
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
            .environmentObject(ConvertViewModel())
    }
}
