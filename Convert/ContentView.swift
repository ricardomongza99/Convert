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
            Section {
                VStack {
                    HStack(alignment: .center, spacing: 20){
                        TextField("From value", value: $fromValue, format: .number)
                            .font(.title)
                            .textFieldStyle(.roundedBorder)
                            
                        Text("=")
                            .foregroundColor(.white)
                            .font(.title)

                        TextField("To value", value: $toValue, format: .number)
                            .font(.title)
                            .textFieldStyle(.roundedBorder)

                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("kg")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)

                        Button {
                            print("Swap")
                        } label: {
                            Text("Swap")
                        }

                        Text("lb")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()

            }
            .background(Color.primaryColor)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
