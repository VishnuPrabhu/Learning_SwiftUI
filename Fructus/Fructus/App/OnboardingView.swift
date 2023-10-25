//
//  OnboardingView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 22/10/23.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.fruitsData) var fruits: [Fruit]
    
    var body: some View {
        TabView {
            ForEach(fruits[0..<5]) { item in
                FruitCardView(fruit: item)
            }
        }
        .tabViewStyle(.page)
        .padding(.vertical, 20)
    }
}

#Preview {
    OnboardingView()
        .environment(\.fruitsData, fruitsData)
        
}
