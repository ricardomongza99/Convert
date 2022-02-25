//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            ConverterView()
            
            UnitTypesView()

            UnitsPickerView()
            
            Spacer()
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
