//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Vishnu Prabhu Rama Chandran on 3/11/23.
//

import Foundation

class AddCoffeeOrderViewModel {
    
    var name: String?
    var email: String?
    var selectedType: String?
    var selectedSize: String?
    
    var types: [String] {
        CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
    
    var updateUI: (Order) -> Void = { _ in }
}

extension AddCoffeeOrderViewModel {
    
    func save() {
        OrderRepository().load(resource: Resource.create(vm: self)) { [weak self] order in
            switch order {
            case .success(let order):
                DispatchQueue.main.async {
                    self?.updateUI(order)
                }
                print(order)
            case .failure(let error):
                print(error)
            }
        }
    }
}
