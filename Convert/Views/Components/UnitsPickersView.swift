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
                unitsPicker(
                    titleKey: "From",
                    selection: $viewModel.fromUnit,
                    width: geometry.size.width / 2
                )
                                
                unitsPicker(
                    titleKey: "To",
                    selection: $viewModel.toUnit,
                    width: geometry.size.width / 2
                )
            }
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color.lightGray)
            )
        }
        .frame(height: 220)
        .padding([.leading, .trailing, .top])
    }
    
     // MARK: - COMPONENTS
    
    @ViewBuilder
    private func unitsPicker(titleKey: String, selection: Binding<Unit>, width: CGFloat) -> some View {
        Picker(titleKey, selection: selection) {
            ForEach(viewModel.units, id: \.self) {
                Text(LocalizedStringKey($0.name))
                    .frame(width: width)
                    .minimumScaleFactor(0.2)
            }
        }
        .frame(width: width)
        .pickerStyle(.wheel)
        .clipped()
        .animation(.easeInOut, value: viewModel.fromUnit)
    }
}

struct UnitsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        UnitsPickersView()
            .environmentObject(ConvertViewModel())
    }
}
