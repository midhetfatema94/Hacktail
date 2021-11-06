//
//  ContentView.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var randomDrink = Drink()
    @State private var showRandomDrink = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 50) {
                NavigationLink(destination: CocktailFormView()) {
                    Text("Get Cocktails from Ingredients")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding()
                .foregroundColor(AppColors.whitePrimary.associatedColor)
                .background(AppColors.orangeAccent.associatedColor)
                .clipShape(Capsule())
                
                NavigationLink(destination: CocktailDetailView(drink: randomDrink), isActive: $showRandomDrink) { }
                
                Button(action: getCocktail) {
                    Text("Get Random Cocktails")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding()
                .foregroundColor(AppColors.whitePrimary.associatedColor)
                .background(AppColors.yellowAccent.associatedColor)
                .clipShape(Capsule())
            }
            .navigationTitle("Welcome to Tailspin")
        }
    }
    
    func getCocktail() {
        WebService().getRandomCocktail() {result, error in
            if let response = result {
                DispatchQueue.main.async {
                    self.randomDrink = response
                    self.showRandomDrink = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
