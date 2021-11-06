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
    var alternate: String?
    var category: String?
    var isAlcoholic: String?
    var glass: String?
    var instructions: String?
    var recipe: [String] = []
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case imageUrlString = "strDrinkThumb"
        case alternate = "strDrinkAlternate"
        case category = "strCategory"
        case isAlcoholic = "strAlcoholic"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        imageUrlString = try container.decode(String.self, forKey: .imageUrlString)
        alternate = try? container.decode(String.self, forKey: .alternate)
        category = try? container.decode(String.self, forKey: .category)
        isAlcoholic = try? container.decode(String.self, forKey: .isAlcoholic)
        glass = try? container.decode(String.self, forKey: .glass)
        instructions = try? container.decode(String.self, forKey: .instructions)
        
        if let ingredient1 = try? container.decode(String.self, forKey: .ingredient1),
           let measure1 = try? container.decode(String.self, forKey: .measure1) {
            recipe.append("\(measure1) \(ingredient1)")
        }
        
        if let ingredient2 = try? container.decode(String.self, forKey: .ingredient2),
           let measure2 = try? container.decode(String.self, forKey: .measure2) {
            recipe.append("\(measure2) \(ingredient2)")
        }
        
        if let ingredient3 = try? container.decode(String.self, forKey: .ingredient3),
           let measure3 = try? container.decode(String.self, forKey: .measure3) {
            recipe.append("\(measure3) \(ingredient3)")
        }
        
        if let ingredient4 = try? container.decode(String.self, forKey: .ingredient4),
           let measure4 = try? container.decode(String.self, forKey: .measure4) {
            recipe.append("\(measure4) \(ingredient4)")
        }
        
        if let ingredient5 = try? container.decode(String.self, forKey: .ingredient5),
           let measure = try? container.decode(String.self, forKey: .measure5) {
            recipe.append("\(measure) \(ingredient5)")
        }
        
        if let ingredient5 = try? container.decode(String.self, forKey: .ingredient6),
           let measure = try? container.decode(String.self, forKey: .measure6) {
            recipe.append("\(measure) \(ingredient5)")
        }
        
        if let ingredient5 = try? container.decode(String.self, forKey: .ingredient7),
           let measure = try? container.decode(String.self, forKey: .measure7) {
            recipe.append("\(measure) \(ingredient5)")
        }
        
        if let ingredient5 = try? container.decode(String.self, forKey: .ingredient8),
           let measure = try? container.decode(String.self, forKey: .measure8) {
            recipe.append("\(measure) \(ingredient5)")
        }
        
        if let ingredient5 = try? container.decode(String.self, forKey: .ingredient9),
           let measure = try? container.decode(String.self, forKey: .measure9) {
            recipe.append("\(measure) \(ingredient5)")
        }
        
        if let ingredient5 = try? container.decode(String.self, forKey: .ingredient10),
           let measure = try? container.decode(String.self, forKey: .measure10) {
            recipe.append("\(measure) \(ingredient5)")
        }
    }
    
    init () {
        id = ""
        name = ""
        imageUrlString = ""
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
