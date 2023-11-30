//
//  Constant.swift
//  Devote
//
//  Created by Vishnu Prabhu Rama Chandran on 29/11/23.
//

import UIKit
import SwiftUI

// MARK: - FORMATTER


let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// MARK: - UI
var backgroundGradient: LinearGradient {
    LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: - UX
let feedback = UINotificationFeedbackGenerator()
