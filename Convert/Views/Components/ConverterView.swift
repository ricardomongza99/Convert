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
                TextField("", text: $viewModel.fromValue)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .frame(height: 64)
                    .padding([.leading, .trailing], 8)
                    .background(
                        Capsule().fill(Color.lightGray)
                    )
                    .keyboardType(.decimalPad)
                    
                Text("=")
                    .font(.title)

                Text(viewModel.toValue, format: .number)
                    .font(.title)
                    .frame(height: 64)
                    .frame(maxWidth: .infinity)
                    .padding([.leading, .trailing], 8)
                    .background(
                        Capsule().fill(Color.lightGray)
                    )

            }
            
            HStack(alignment: .top, spacing: 0) {
                unitText(text: viewModel.fromUnit.unit.symbol)

                Button {
                    viewModel.swapUnits()
                } label: {
                    Image("ArrowsIcon")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.primaryColor)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                }

                unitText(text: viewModel.toUnit.unit.symbol)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func unitText(text: String) -> some View {
        Text(text)
            .font(.title)
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
            .environmentObject(ConvertViewModel())
    }
}
