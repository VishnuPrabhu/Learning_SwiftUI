//
//  WeatherRepository.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation

struct WeatherRepository {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T) -> ()) where T: Decodable {
        //        guard let url = resource.url else {
        //            fatalError("\(NetworkError.urlError)")
        //        }
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            guard let data = data else {
                fatalError("\(NetworkError.domainError)")
            }
            
            guard let result = try? JSONDecoder().decode(T.self, from: data) else {
                fatalError("\(NetworkError.decodingError)")
            }
            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
}
