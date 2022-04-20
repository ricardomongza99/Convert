//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

// MARK: - BODY

struct ConvertView: View {
    
    var body: some View {
        VStack {
            ConverterView()
            UnitTypeSelectionView()
            UnitsPickersView()
            Spacer()
        }
        .padding(.top)
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

// MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView()
            .environmentObject(ConvertViewModel())
            //.previewDevice("iPad Pro(9.7-inch")
            .preferredColorScheme(.light)
            .environment(\.locale, .init(identifier: "es"))
    }
}
