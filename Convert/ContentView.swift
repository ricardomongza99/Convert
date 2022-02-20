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
    
    @State private var fromUnit = "Kilogram"
    @State private var toUnit = "Pound"
    
    let weightUnits = ["Milligram", "Gram", "Kilogram", "Ounce", "Pound", "Stone", "Tonne"]
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Section {
                VStack {
                    HStack(alignment: .center, spacing: 20){
                        TextField("From value", value: $fromValue, format: .number)
                            .font(.title)
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(40)
                            
                        Text("=")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()

                        TextField("To value", value: $toValue, format: .number)
                            .font(.title)
                            .textFieldStyle(.roundedBorder)

                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text("kg")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)

                        Button {
                            
                        } label: {
                            Image("arrows")
                                .aspectRatio(1, contentMode: .fit)
                        }

                        Text("lb")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding()

            }
            .background(Color.primaryColor)
            
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Picker("From", selection: $fromUnit) {
                        ForEach(weightUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 2)
                    .clipped()
                    
                    Divider()
                    
                    Picker("To", selection: $toUnit) {
                        ForEach(weightUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 2)
                    .clipped()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.lightGray, lineWidth: 1)
                )
                .background(Color.white)
                .cornerRadius(40)
                .shadow(color: .lightGray, radius: 8.0, x: 0, y: 0)

            }
            .padding([.leading, .trailing])
            .frame(height: 250)

            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
