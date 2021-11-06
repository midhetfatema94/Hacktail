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
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center, spacing: 10) {
                AsyncImage(url: URL(string: drink.imageUrlString)) {image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: dimension, height: dimension)
                .border(Color.gray, width: 2)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(drink.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.grayPrimary.associatedColor)
                
                Text("Is an \(drink.isAlcoholic ?? "") drink")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(AppColors.grayPrimary.associatedColor)
                
                Text("Should drink in \(drink.glass ?? "")")
                    .font(.title3)
                    .foregroundColor(AppColors.secondary.associatedColor)
                
                Text("Ingredients")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.grayPrimary.associatedColor)
                    .padding([.top])
                
                VStack(spacing: 5) {
                    ForEach(drink.recipe, id: \.self) {recipeItem in
                        Text(recipeItem)
                            .font(.title3)
                            .foregroundColor(AppColors.secondary.associatedColor)
                    }
                }
                
                Text(drink.instructions ?? "")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(AppColors.secondary.associatedColor)
                    .padding()
            }
        }
        .padding([.leading, .trailing])
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
