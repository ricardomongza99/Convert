//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fromValue = 0.0
    private var toValue: Double {
        let temp = Measurement(value: fromValue, unit: fromUnit.unit)
        return temp.converted(to: toUnit.unit).value.rounded(4)
    }
    
    let massUnits = ModelData().massUnits
    
    @State private var fromUnit = ModelData().massUnits[1]
    @State private var toUnit = ModelData().massUnits[5]
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Section {
                VStack {
                    HStack(alignment: .center, spacing: 20){
                        TextField("", value: $fromValue, format: .number)
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .frame(height: 64)
                            .padding([.leading, .trailing], 8)
                            .background(
                                Capsule().fill(Color.white)
                            )
                            
                        Text("=")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()

                        Text(toValue, format: .number)
                            .font(.title)
                            .frame(height: 64)
                            .frame(maxWidth: .infinity)
                            .padding([.leading, .trailing], 8)
                            .background(
                                Capsule().fill(Color.white)
                            )

                    }
                    
                    HStack(alignment: .top, spacing: 0) {
                        Text(fromUnit.symbol)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)

                        Button {
                            
                        } label: {
                            Image("arrows")
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }

                        Text(toUnit.symbol)
                            .font(.title)
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
                        ForEach(massUnits, id: \.self) {
                            Text($0.name)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: geometry.size.width / 2)
                    .clipped()
                    
                    Divider()
                    
                    Picker("To", selection: $toUnit) {
                        ForEach(massUnits, id: \.self) {
                            Text($0.name)
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
