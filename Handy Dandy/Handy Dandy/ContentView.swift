//
//  ContentView.swift
//  Handy Dandy
//
//  Created by Joshua Austin on 5/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var hexadecimal: String = ""
    @State private var red: String = ""
    @State private var green: String = ""
    @State private var blue: String = ""
    @State private var redDecimal: String = ""
    @State private var greenDecimal: String = ""
    @State private var blueDecimal: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField(
                    "Hexadecimal (#RRGGBB)",
                    text: $hexadecimal
                )
                .onSubmit {
                    convert(hexadecimal: self.hexadecimal)
                }
                .disableAutocorrection(true)
                
                Button("Convert") {
                    
                }
            }
            .padding()
            HStack {
                TextField(
                    "Red",
                    text: $red
                )
                TextField(
                    "Green",
                    text: $green
                )
                TextField(
                    "Blue",
                    text: $blue
                )
            }
            .padding()
            HStack {
                TextField(
                    "Red (Decimal)",
                    text: $redDecimal
                )
                TextField(
                    "Green (Decimal)",
                    text: $greenDecimal
                )
                TextField(
                    "Blue (Decimal)",
                    text: $blueDecimal
                )
            }
            .padding()
        }
        .padding()
    }
    
    private func convert(hexadecimal: String) {
        
    }
}



#Preview {
    ContentView()
}
