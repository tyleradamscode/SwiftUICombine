//
//  URLSessionAPIClient.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation
import Combine

struct URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        var url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        url.append(queryItems: endpoint.queryItems ?? [])
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        LogService.log("Url request -> \(request.debugDescription)")
        return URLSession.shared.dataTaskPublisher(for: request)
            .handleEvents(receiveOutput: { (data, response) in
                LogService.log("Response Status Code: \((response as? HTTPURLResponse)?.statusCode ?? -1)")
                LogService.log("Response Data: \(String(data: data, encoding: .utf8) ?? "")")
            })
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.invalidResponse
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
