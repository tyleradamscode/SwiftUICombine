//
//  Meal.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation

// MARK: - Meal
struct Meal: Decodable {
    let name: String
    let thumbnailURL: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case thumbnailURL = "strMealThumb"
        case id = "idMeal"
    }
}
