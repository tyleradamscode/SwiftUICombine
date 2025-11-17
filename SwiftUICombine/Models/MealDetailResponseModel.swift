//
//  MealDetailResponseModel.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation

// MARK: - MealListResponseModel
struct MealDetailResponseModel: Decodable {
    let meals: [MealDetail]
}
