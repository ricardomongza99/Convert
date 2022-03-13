//
//  UnitsPickerView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 12/03/22.
//

import SwiftUI

struct UnitsPickerView: View {
    @EnvironmentObject var viewModel: ConvertViewModel

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Picker("From", selection: $viewModel.fromUnit) {
                    ForEach(viewModel.units, id: \.self) {
                        Text(LocalizedStringKey($0.name))
                            .frame(width: geometry.size.width/2 - 20)
                            .minimumScaleFactor(0.2)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: geometry.size.width / 2)
                .clipped()
                .animation(.easeInOut, value: viewModel.fromUnit)
                
                Divider()
                
                Picker("To", selection: $viewModel.toUnit) {
                    ForEach(viewModel.units, id: \.self) {
                        Text(LocalizedStringKey($0.name))
                            .frame(width: geometry.size.width/2 - 20)
                            .minimumScaleFactor(0.2)
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
    static var previews: some View {
        UnitsPickerView()
            .environmentObject(ConvertViewModel())
    }
}
