//
//  CocktailFormView.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import SwiftUI

struct CocktailFormView: View {
    
    @State private var ingredients: [String] = ["Dry Vermouth", "Gin", "Anis"]
    @State private var showDrinks = false
    @State private var allDrinks: [Drink] = []
    
    var body: some View {
        VStack {
            NavigationLink(destination: CocktailListView(data: allDrinks), isActive: $showDrinks) { }
            VStack {
                Text("Add your main ingredients")
                    .padding()
                
                ForEach(Array(zip(ingredients.indices, ingredients)), id: \.0) { index, item in
                    TextField("Ingredient #\(index + 1)", text: $ingredients[index])
                        .padding()
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Button("Add More Ingredients", action: { ingredients.append("") })
                    
                    Button("Remove Ingredients", action: { ingredients.removeLast() })
                }
                
                Button("Submit", action: submitIngredients)
            }
        }
        .navigationTitle("Your ingredients")
    }
    
    func submitIngredients() {
        WebService().searchCocktail(ingredients: ingredients) {result, error in
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
