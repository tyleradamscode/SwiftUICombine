//
//  MealDetailsService.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation
import Combine

protocol MealDetailServiceProtocol {
    func getMealDetail(forId id: String) -> AnyPublisher<MealDetailResponseModel, Error>
}

class MealDetailService: MealDetailServiceProtocol {
    let apiClient = URLSessionAPIClient<MealDetailEndpoint>()
    
    func getMealDetail(forId id: String) -> AnyPublisher<MealDetailResponseModel, Error> {
        return apiClient.request(.getMealDetail(id))
    }
}

enum MealDetailEndpoint: APIEndpoint {
    case getMealDetail(_ id: String)
    
    var baseURL: URL {
        return URL(string: "https://themealdb.com/api/json/v1/1/lookup.php")!
    }
    
    var path: String {
        switch self {
        case .getMealDetail:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMealDetail:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getMealDetail:
            return [:]
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .getMealDetail:
            return [:]
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .getMealDetail(let id):
            return [URLQueryItem(name: "i", value: id)]
        }
    }
}
