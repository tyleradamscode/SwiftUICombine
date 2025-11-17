//
//  RecipeService.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation
import Combine

protocol MealServiceProtocol {
    func getMealsList(for categoryName: String) -> AnyPublisher<MealListResponseModel, Error>
}

class MealService: MealServiceProtocol {
    let apiClient = URLSessionAPIClient<MealEndpoint>()
    
    func getMealsList(for categoryName: String) -> AnyPublisher<MealListResponseModel, Error> {
        return apiClient.request(.getMealsList(categoryName))
    }
}

enum MealEndpoint: APIEndpoint {
    case getMealsList(_ categoryName: String)
    
    var baseURL: URL {
        return URL(string: "https://themealdb.com/api/json/v1/1/filter.php")!
    }
    
    var path: String {
        switch self {
        case .getMealsList:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMealsList:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getMealsList:
            return [:]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getMealsList:
            return [:]
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getMealsList(let categoryName):
            return [URLQueryItem(name: "c", value: categoryName)]
        }
    }
}
