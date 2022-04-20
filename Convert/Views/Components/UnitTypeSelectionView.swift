//
//  UnitTypeSelectionView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 12/03/22.
//

import SwiftUI

// MARK: - BODY

struct UnitTypeSelectionView: View {
    @EnvironmentObject var viewModel: ConvertViewModel
    @State private var isUpdatingCurrencies = false
    
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
            .padding([.leading, .trailing])
        }
    }
}

// MARK: - PREVIEWS

struct UnitTypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTypeSelectionView()
            .environmentObject(ConvertViewModel())
    }
}

// MARK: - COMPONENTS

extension UnitTypeSelectionView {
    
    private func unitTypeButton(unitType: UnitType, isSelected: Bool) -> some View {
        Button {
            viewModel.unitType = unitType
            if unitType == .currency {
                Task {
                    isUpdatingCurrencies = true
                    await viewModel.updateCurrencies()
                    isUpdatingCurrencies = false
                }
            }
        } label: {
            Text(LocalizedStringKey(unitType.rawValue))
                .font(.callout)
                .bold()
            
        }
        .padding([.leading, .trailing])
        .padding([.top, .bottom], 12)
        .foregroundColor(isSelected ? .white : .primary)
        .background(isSelected ? Color.primaryColor : Color.lightGray)
        .clipShape(Capsule(style: .continuous))
        .opacity(unitType == .currency && isUpdatingCurrencies ? 0 : 1)
        .overlay{
            if unitType == .currency && isUpdatingCurrencies {
                ProgressView()
            }
        }
        .disabled(isSelected || isUpdatingCurrencies)
    }
}
