//
//  UnitTypesView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 23/02/22.
//

import SwiftUI

struct UnitTypesView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.unitTypes, id: \.self) { unitType in
                    UnitTypeButton(
                        unitType: unitType,
                        isSelected: viewModel.currentUnitType == unitType
                    )
                }
            }
            .padding()
        }
    }
}

struct UnitTypesView_Previews: PreviewProvider {
    static let unitTypes = ViewModel().unitTypes
    static var previews: some View {
        UnitTypesView()
            .environmentObject(ViewModel())
    }
}
