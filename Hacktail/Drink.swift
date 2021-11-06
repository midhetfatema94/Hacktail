//
//  Drink.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import Foundation

struct Drink: Decodable, Identifiable {
    
    var id: String
    var name: String
    var imageUrlString: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case imageUrlString = "strDrinkThumb"
    }
    
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        lhs.id == rhs.id
    }
}

struct DrinkMain: Decodable {
    
    var drinks: [Drink]
    
    enum CodingKeys: CodingKey {
        case drinks
    }
}
