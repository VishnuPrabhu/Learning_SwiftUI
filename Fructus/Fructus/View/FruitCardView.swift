//
//  FruitCardView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 22/10/23.
//

import SwiftUI

struct FruitCardView: View {
    let fruit: Fruit
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .black.opacity(0.2), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.0)
                
                Text(fruit.title)
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
                
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                StartButtonView()
                
            }
        } //: ZStack
        .onAppear(perform: {
            withAnimation(.easeOut) {
                isAnimating = true
            }
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom))
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

#Preview {
    FruitCardView(fruit: fruitsData[1])
        .previewLayout(.sizeThatFits)
}
