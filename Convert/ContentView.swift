//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var fromValue = 0.0
    @State private var toValue = 0.0
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack {
                TextField("From value", value: $fromValue, format: .number)

                
                TextField("To value", value: $toValue, format: .number)
            }
            .background(Color.primaryColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
