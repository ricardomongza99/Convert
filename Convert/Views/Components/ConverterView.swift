//
//  ConverterView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 12/03/22.
//

import SwiftUI

// MARK: - BODY

struct ConverterView: View {
    @EnvironmentObject var viewModel: ConvertViewModel

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 20) {
                inputTextField(text: $viewModel.fromValue)
                Text("=")
                    .font(.title)
                // TODO: replace with another input textField
                outputText
            }
            
            HStack(alignment: .top, spacing: 0) {
                unitText(text: viewModel.fromUnit.unit.symbol)
                convertButton
                unitText(text: viewModel.toUnit.unit.symbol)
            }
        }
        .padding([.leading, .trailing])
    }
}

// MARK: - PREVIEWS

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
            .environmentObject(ConvertViewModel())
    }
}

// MARK: - COMPONENTS

extension ConverterView {
    
    private func inputTextField(text: Binding<String>) -> some View {
        TextField("", text: text)
            .multilineTextAlignment(.center)
            .font(.title)
            .frame(height: 64)
            .padding([.leading, .trailing], 8)
            .background(
                Capsule().fill(Color.lightGray)
            )
            .keyboardType(.decimalPad)
    }

    private var outputText: some View {
        Text(viewModel.toValue, format: .number)
            .font(.title)
            .frame(height: 64)
            .frame(maxWidth: .infinity)
            .padding([.leading, .trailing], 8)
            .background(
                Capsule().fill(Color.lightGray)
            )
    }

    private func unitText(text: String) -> some View {
        Text(text)
            .font(.title)
            .frame(maxWidth: .infinity)
    }

    private var convertButton: some View {
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
    }
}
