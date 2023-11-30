//
//  KeyboardExtension.swift
//  Devote
//
//  Created by Vishnu Prabhu Rama Chandran on 29/11/23.
//

import SwiftUI

extension View {
    #if canImport(UIKit)
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    #endif
}
