//
//  CocktailDetailView.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import SwiftUI

struct CocktailDetailView: View {
    
    @State var drink: Drink
    
    let dimension = UIScreen.main.bounds.width - 40
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: drink.imageUrlString)) {image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: dimension, height: dimension)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(drink.name)
            
            Text(drink.isAlcoholic ?? "")
            
            Text(drink.glass ?? "")
            
            Text("Ingredients")
            
            VStack {
                ForEach(drink.recipe, id: \.self) {recipeItem in
                    Text(recipeItem)
                }
            }
            
            Text(drink.instructions ?? "")
        }
        .onAppear(perform: getCocktailDetails)
    }
    
    func getCocktailDetails() {
        WebService().getCocktail(id: drink.id) {result, error in
            if let response = result {
                DispatchQueue.main.async {
                    self.drink = response
                }
            }
        }
    }
}
