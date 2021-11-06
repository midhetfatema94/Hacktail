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
            VStack {
                NavigationLink(destination: CocktailFormView()) { Text("Get Cocktails from Ingredients") }
                NavigationLink(destination: CocktailDetailView(drink: randomDrink), isActive: $showRandomDrink) { }
                Button("Get Random Cocktails", action: getCocktail)
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
