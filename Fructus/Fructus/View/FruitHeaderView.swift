//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 23/10/23.
//

import SwiftUI

struct FruitHeaderView: View {
    let fruit: Fruit
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimating ? 1.0 : 0.6)
        } //: ZStack
        .frame(height: 440)
        .onAppear(perform: {
            withAnimation {
                isAnimating = true
            }
        })
    }
}

#Preview {
    FruitHeaderView(fruit: fruitsData[0])
}
