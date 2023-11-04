//
//  Resource.swift
//  HotCoffee
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation

enum HttpMethod: String {
    case get = "GET", post = "POST"
}

struct Resource<T> where T : Codable {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
    
    init(url: URL) {
        self.url = url
    }
}

extension Resource where T == [Order] {
    static var all: Resource<T> = {
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("\(Result<Order, NetworkError>.failure(.urlError))")
        }
        return Resource.init(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order> {
        let order = Order(vm)
        guard let url = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            fatalError("\(Result<Order, NetworkError>.failure(.urlError))")
        }
        guard let body = try? JSONEncoder().encode(order) else {
            fatalError("\(Result<Order, NetworkError>.failure(.decodingError))")
        }
        
        var resource = Resource<Order>(url: url)
        resource.httpMethod = .post
        resource.body = body
        return resource
    }
}
