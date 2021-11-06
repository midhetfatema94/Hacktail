//
//  CocktailFormView.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import SwiftUI

struct CocktailFormView: View {
    
    @State private var ingredientOne: String = "Dry Vermouth"
    @State private var ingredientTwo: String = "Gin"
    @State private var ingredientThree: String = "Anis"
    @State private var showDrinks = false
    @State private var allDrinks: [Drink] = []
    
    var body: some View {
        VStack {
            NavigationLink(destination: CocktailListView(data: allDrinks), isActive: $showDrinks) { }
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
                Button("Submit", action: submitIngredients)
            }
        }
    }
    
    func submitIngredients() {
        WebService().searchCocktail(ingredients: [ingredientOne, ingredientTwo, ingredientThree]) {result, error in
            if let response = result {
                DispatchQueue.main.async {
                    self.allDrinks = response
                    self.showDrinks = true
                }
            }
        }
    }
}

struct CocktailFormView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailFormView()
    }
}
