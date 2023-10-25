//
//  Environment.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 22/10/23.
//

import Foundation
import SwiftUI

private struct FruitsData : EnvironmentKey {
    static let defaultValue: [Fruit] = []
}

extension EnvironmentValues {
    var fruitsData: [Fruit] {
        get { self[FruitsData.self] }
        set { self[FruitsData.self] = newValue }
    }
}

extension View {
    func fruitsData(_ data: [Fruit]) -> some View {
        environment(\.fruitsData, data)
    }
}
