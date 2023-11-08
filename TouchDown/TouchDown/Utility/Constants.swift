//
//  Constants.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 5/11/23.
//

import Foundation
import SwiftUI

// DATA
let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let sampleProduct = products[0]

// COLOR
let colorBackground = Color("ColorBackground")
let colorGray = Color(UIColor.systemGray4)

// LAYOUT
let rowSpacing = CGFloat(10)
let columnSpacing = CGFloat(10)
var gridLayout: [GridItem] {
    Array(repeating: GridItem(.flexible()), count: 2)
}

// UI
let feedback = UIImpactFeedbackGenerator(style: .medium)
