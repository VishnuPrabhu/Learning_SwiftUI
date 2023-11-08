//
//  Shop.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 8/11/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var isShowingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
