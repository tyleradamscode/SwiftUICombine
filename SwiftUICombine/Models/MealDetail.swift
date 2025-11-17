//
//  MealDetail.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation

// MARK: - MealDetail
struct MealDetail: Decodable {
    let id: String
    let name: String
    let instructions: String
    var ingredients: [String]
    var measurements: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case imageUrl = "strMealThumb"
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
}

extension MealDetail {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        instructions = try container.decode(String.self, forKey: .instructions)
        
        var ingredients: [String] = []
        var measurements: [String] = []
        for i in 1...20 {
            if let ingredientKey = CodingKeys.init(stringValue: "strIngredient\(i)") {
                if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey),
                   !ingredient.isEmpty {
                   ingredients.append(ingredient)
                }
            }
            if let measurementKey = CodingKeys.init(stringValue: "strMeasure\(i)") {
                if let measurement = try container.decodeIfPresent(String.self, forKey: measurementKey),
                   !measurement.isEmpty {
                    measurements.append(measurement)
                }
            }
        }
        self.ingredients = ingredients
        self.measurements = measurements
    }
}

