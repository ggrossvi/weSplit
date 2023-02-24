//
//  ContentView.swift
//  weSplit
//
//  Created by Gloria Villa on 12/31/22.
//

import SwiftUI
// command r to build
// command shift k   to get keyboard
// command [   to push everything in one select text then do the command
//  how do I keep track of parens

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format:
                            .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.numbersAndPunctuation)
                    /* https://developer.apple.com/documentation/uikit/uikeyboardtype
                     https://www.hackingwithswift.com/forums/swiftui/textfield-text-has-no-member-keyboardtype/760
                     */
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section {
                
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                    }
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                
                }
            }
            .navigationTitle("weSplit")
        }
    }
}
                
