//
//  ContentView.swift
//  UnitConversion
//
//  Created by Soumya Deekonda on 11/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 0.0
    @State private var sourceUnit = UnitLength.meters
    @State private var outputUnit = UnitLength.kilometers
    let units: [UnitLength] = [.kilometers, .meters, .miles, .yards, .feet]
  //  @FocusState private var inputIsFocused: Bool

    let formatter: MeasurementFormatter
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    var sourceConversionToOutput: String {
        let inputMeasurement = Measurement(value: input, unit: sourceUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
    
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("Input Value", value: $input, format: FloatingPointFormatStyle<Double>.number)
                        .keyboardType(.decimalPad)
                       // .focused($inputIsFocused)
                    
                } header: {
                    Text("Input value")
                }
                
                Picker("Convert from", selection: $sourceUnit) {
                    ForEach(units, id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                
                Picker("Convert to", selection: $outputUnit) {
                    ForEach(units, id: \.self) {
                        Text(formatter.string(from: $0).capitalized)
                    }
                }
                
                Section {
                    Text(sourceConversionToOutput)
                } header: {
                    Text("Result")
                }
                
            }
            .navigationTitle("UnitConversion")
            .navigationBarTitleDisplayMode(.inline)
           // .toolbar {
              //  ToolbarItemGroup(placement: .keyboard) {
               //     Spacer()
                 //   Button("Done") {
                   //     inputIsFocused = false
                   // }
               // }
          //  }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
