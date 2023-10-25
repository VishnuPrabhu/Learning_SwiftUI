//
//  Fruit.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 22/10/23.
//

import Foundation
import SwiftUI

struct Fruit : Identifiable, Hashable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}
