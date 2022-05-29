//
//  ContentView.swift
//  Converter
//
//  Created by Jeff Norton on 5/13/22.
//

import SwiftUI

struct ContentView: View {
    
    /*
     Requirements
     1) Conversion dimension options
     2) Convert value
     3) Convert from unit type
     4) Convert to unit type
     5) Result
     */
    
    @FocusState private var inputAmountIsFocused: Bool
    
    let formatter: MeasurementFormatter
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    
    let dimensions = ["Distance", "Mass", "Temperature", "Time"]
//    let conversions = ["Distance", "Mass", "Temperature", "Time"]
    @State private var selectedDimension = "Temperature"
    let dimensionTypes = [
        [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles],
        [UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds],
        [UnitTemperature.celsius, UnitTemperature.fahrenheit, UnitTemperature.kelvin],
        [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
    ]
    @State private var inputDimensionType: Dimension = UnitLength.meters
    @State private var inputAmount = 0.0
    @State private var outputDimentionType: Dimension = UnitLength.yards
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Dimension", selection: $selectedDimension) {
                        ForEach(0..<dimensions.count) {
                            Text(dimensions[$0])
                        }
                    }
                }
                
                Section {
                    TextField("Input amount", value: $inputAmount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputAmountIsFocused)
                    
                    Picker("Input dimension type", selection: $inputDimensionType) {
                        
                    }
                } header: {
                    Text("Amount to convert")
                            }
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
