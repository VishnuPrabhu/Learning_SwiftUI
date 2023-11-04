//
//  OrderListViewModel.swift
//  HotCoffee
//
//  Created by Vishnu Prabhu Rama Chandran on 3/11/23.
//

import Foundation

class OrderListViewModel {
    let repository = OrderRepository()
    
    var orderList: [OrderViewModel] = []
    
    var numberOfRows: Int {
        orderList.count
    }
    
    var updateUI: () -> Void = {}
        
    func order(at index: Int) -> OrderViewModel {
        return orderList[index]
    }
    
    func populateOrders() {
//        guard let coffeeOrdersURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
//            fatalError("URL was incorrect")
//        }
        repository.load(resource: Resource.all /*Resource<[Order]>(url: coffeeOrdersURL)*/) { [weak self] result in
            switch result {
            case let .success(order):
                self?.orderList = order.map(OrderViewModel.init)
                DispatchQueue.main.async {
                    self?.updateUI()
                }
                print(order)
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct OrderViewModel {
    let order: Order
    
    init(_ order: Order) {
        self.order = order
    }
    
    var name: String {
        order.name
    }
    
    var email: String {
        order.email
    }
    
    var type: String {
        order.type.rawValue.capitalized
    }
    
    var size: String {
        order.size.rawValue.capitalized
    }
}
