//
//  Order.swift
//  HotCoffee
//
//  Created by Vishnu Prabhu Rama Chandran on 3/11/23.
//

import Foundation

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}

enum CoffeeType: String, Codable, CaseIterable {
    case latte, cappucino, espresso, cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small, medium, large
}

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let type = CoffeeType(rawValue: vm.selectedType!.lowercased()),
              let size = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = type
        self.size = size
    }
}
