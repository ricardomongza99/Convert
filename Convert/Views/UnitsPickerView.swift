//
//  UnitsPicker.swift
//  Convert
//
//  Created by Ricardo Montemayor on 21/02/22.
//

import SwiftUI

struct UnitsPickerView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Picker("From", selection: $viewModel.fromUnit) {
                    ForEach(viewModel.currentUnits, id: \.self) {
                        Text($0.name)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: geometry.size.width / 2)
                .clipped()
                .animation(.easeInOut, value: viewModel.fromUnit)
                
                Divider()
                
                Picker("To", selection: $viewModel.toUnit) {
                    ForEach(viewModel.currentUnits, id: \.self) {
                        Text($0.name)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: geometry.size.width / 2)
                .clipped()
                .animation(.easeInOut, value: viewModel.toUnit)

            }
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.lightGray, lineWidth: 1)
            )
            .background(Color.white)
            .cornerRadius(40)
            .shadow(color: .lightGray, radius: 8.0, x: 0, y: 0)

        }
        .padding([.leading, .trailing])
        .frame(height: 250)
    }
}

struct UnitsPickerView_Previews: PreviewProvider {
    static let massUnits = ViewModel().massUnits
    static var previews: some View {
        UnitsPickerView()
            .environmentObject(ViewModel())
    }
}
