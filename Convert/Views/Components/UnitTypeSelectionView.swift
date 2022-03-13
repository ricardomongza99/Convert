//
//  UnitTypeSelectionView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 12/03/22.
//

import SwiftUI

struct UnitTypeSelectionView: View {
    @EnvironmentObject var viewModel: ConvertViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.unitTypes, id: \.self) { unitType in
                    unitTypeButton(
                        unitType: unitType,
                        isSelected: unitType == viewModel.unitType
                    )
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func unitTypeButton(unitType: UnitType, isSelected: Bool) -> some View {
        Button {
            viewModel.unitType = unitType
        } label: {
            Text(LocalizedStringKey(unitType.rawValue))
                .font(.callout)
                .padding()
                .foregroundColor(isSelected ? .white : .primaryColor)
                .background(isSelected ? Color.lightGray : Color.white)
                .clipShape(Capsule(style: .continuous))
                .shadow(color: .lightGray, radius: 8.0, x: 0, y: 0)
        }
    }
}

struct UnitTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTypeSelectionView()
            .environmentObject(ConvertViewModel())
    }
}
