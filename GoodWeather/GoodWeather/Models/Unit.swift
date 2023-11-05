//
//  Unit.swift
//  GoodWeather
//
//  Created by Vishnu Prabhu Rama Chandran on 4/11/23.
//

import Foundation
import UIKit

enum Unit: String, CaseIterable {
    case celcius = "metric", farenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch self {
            case .celcius:
                "Celcius"
            case .farenheit:
                "Farenheit"
            }
        }
    }
}
