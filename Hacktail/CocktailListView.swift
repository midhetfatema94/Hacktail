//
//  CocktailListView.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import SwiftUI

struct CocktailListView: View {
    @State var data: [Drink]

    let dimension = UIScreen.main.bounds.width/2 - 60
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: dimension))],
                      spacing: 20) {
                ForEach(data) { item in
                    VStack {
                        AsyncImage(url: URL(string: item.imageUrlString)) {image in
                            image.resizable()
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: dimension, height: dimension)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text(item.name)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView(data: [])
    }
}
