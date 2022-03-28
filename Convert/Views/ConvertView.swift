//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ConvertView: View {
    
    var body: some View {
        VStack {
            ConverterView()
            UnitTypeSelectionView()
            UnitsPickersView()
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertView()
            .environmentObject(ConvertViewModel())
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "es"))
    }
}
