//
//  OrderRepository.swift
//  HotCoffee
//
//  Created by Vishnu Prabhu Rama Chandran on 3/11/23.
//

import Foundation

class OrderRepository {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        var urlRequest = URLRequest(url: resource.url)
        
        urlRequest.httpMethod = resource.httpMethod.rawValue
        urlRequest.httpBody = resource.body
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.domainError))
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            guard let result = result else {
                return completion(.failure(.decodingError))
            }
            completion(.success(result))
        }.resume()
    }
}

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}
