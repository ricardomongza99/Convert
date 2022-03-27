//
//  UnitsPickerView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 12/03/22.
//

import SwiftUI

struct UnitsPickersView: View {
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
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.lightGray)
            )
                

        }
        .padding([.leading, .trailing])
        .frame(height: 250)
    }
}

struct UnitsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        UnitsPickersView()
            .environmentObject(ConvertViewModel())
    }
}
