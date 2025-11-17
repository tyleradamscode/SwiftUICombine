//
//  MealListResponseModel.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation

// MARK: - MealListResponseModel
struct MealListResponseModel: Decodable {
    let meals: [Meal]
}
