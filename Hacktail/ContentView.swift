//
//  ContentView.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var ingredientOne: String = "Dry Vermouth"
    @State private var ingredientTwo: String = "Gin"
    @State private var ingredientThree: String = "Anis"
    
    var body: some View {
        VStack {
            Text("Add your main ingredients")
                .padding()
            TextField("Ingredient #1", text: $ingredientOne)
                .padding()
                .textFieldStyle(.roundedBorder)
            TextField("Ingredient #2", text: $ingredientTwo)
                .padding()
                .textFieldStyle(.roundedBorder)
            TextField("Ingredient #3", text: $ingredientThree)
                .padding()
                .textFieldStyle(.roundedBorder)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
