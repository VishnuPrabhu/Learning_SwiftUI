//
//  FructusApp.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 20/10/23.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
                    .environment(\.fruitsData, fruitsData)
            } else {
                ContentView()
                    .environment(\.fruitsData, fruitsData)
            }
        }
    }
}
