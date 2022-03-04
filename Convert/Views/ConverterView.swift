//
//  ContentView.swift
//  Convert
//
//  Created by Ricardo Montemayor on 16/02/22.
//

import SwiftUI

struct ConverterView: View {
    @StateObject var viewModel = ConverterViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // Converter
            Section {
                VStack {
                    HStack(alignment: .center, spacing: 20) {
                        TextField("", value: $viewModel.fromValue, format: .number)
                            .multilineTextAlignment(.center)
                            .font(.title)
                            .frame(height: 64)
                            .padding([.leading, .trailing], 8)
                            .background(
                                Capsule().fill(Color.white)
                            )
                            .keyboardType(.decimalPad)
                            
                        Text("=")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()

                        Text(viewModel.toValue, format: .number)
                            .font(.title)
                            .frame(height: 64)
                            .frame(maxWidth: .infinity)
                            .padding([.leading, .trailing], 8)
                            .background(
                                Capsule().fill(Color.white)
                            )

                    }
                    
                    HStack(alignment: .top, spacing: 0) {
                        unitText(text: viewModel.fromUnit.unit.symbol)

                        Button(action: viewModel.swapUnits) {
                            Image("arrows")
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }

                        unitText(text: viewModel.toUnit.unit.symbol)
                    }
                }
                .padding()

            }
            .background(Color.primaryColor)
            
            // Unit type selection
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.unitTypes, id: \.self) { unitType in
                            unitTypeButton(
                                unitType: unitType,
                                isSelected: unitType == viewModel.currentUnitType
                            )
                        }
                    }
                    .padding()
                }
            }
            
            // Unit selection
            Section {
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Picker("From", selection: $viewModel.fromUnit) {
                            ForEach(viewModel.currentUnits, id: \.self) {
                                Text($0.name)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: geometry.size.width / 2)
                        .clipped()
                        .animation(.easeInOut, value: viewModel.fromUnit)
                        
                        Divider()
                        
                        Picker("To", selection: $viewModel.toUnit) {
                            ForEach(viewModel.currentUnits, id: \.self) {
                                Text($0.name)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(width: geometry.size.width / 2)
                        .clipped()
                        .animation(.easeInOut, value: viewModel.toUnit)

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
            }
            
            Spacer()
            
            
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
    // MARK: - COMPONENTS
    
    @ViewBuilder
    private func unitText(text: String) -> some View {
        Text(text)
            .font(.title)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func unitTypeButton(unitType: UnitType, isSelected: Bool) -> some View {
        Button {
            viewModel.currentUnitType = unitType
        } label: {
            Text(unitType.rawValue)
                .font(.callout)
                .padding()
                .foregroundColor(isSelected ? .white : .primaryColor)
                .background(isSelected ? Color.lightGray : Color.white)
                .clipShape(Capsule(style: .continuous))
                .shadow(color: .lightGray, radius: 8.0, x: 0, y: 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView()
    }
}
