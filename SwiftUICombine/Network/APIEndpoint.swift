//
//  APIEndpoint.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation
protocol APIEndpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var queryItems: [URLQueryItem]? { get } 
}
