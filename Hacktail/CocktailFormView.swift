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
                ForEach(Array(zip(ingredients.indices, ingredients)), id: \.0) { index, item in
                    HStack {
                        Text("Ingredient #\(index + 1)")
                            .font(.title3)
                            .fontWeight(.medium)
                        
                        TextField("Ingredient #\(index + 1)", text: $ingredients[index])
                            .padding()
                            .font(.title3)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                
                HStack {
                    Button(action: { ingredients.append("") }) {
                        Text("Add More")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding([.leading, .trailing])
                    .foregroundColor(AppColors.whitePrimary.associatedColor)
                    .background(AppColors.grayPrimary.associatedColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button(action: { ingredients.removeLast() }) {
                        Text("Remove Last")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    .padding([.leading, .trailing])
                    .foregroundColor(AppColors.whitePrimary.associatedColor)
                    .background(AppColors.grayPrimary.associatedColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()
                
                Button(action: submitIngredients) {
                    Text("Submit")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding()
                .foregroundColor(AppColors.whitePrimary.associatedColor)
                .background(AppColors.orangeAccent.associatedColor)
                .clipShape(Capsule())
            }
            .padding()
        }
        .navigationTitle("Add your main ingredients")
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
