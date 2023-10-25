//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 23/10/23.
//

import SwiftUI

struct FruitDetailView: View {
    // MARK: - Properties
    let fruit: Fruit
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    FruitHeaderView(fruit: fruit)
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundStyle(fruit.gradientColors[1])
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        FruitNutrientsView(fruit: fruit)
                        Text("Learn more about \(fruit.title)")
                            .fontWeight(.bold)
                            .foregroundStyle(fruit.gradientColors[1])
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    } //: Vstack
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                } //: Vstack
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(.hidden, for: .navigationBar)
            } //: Scrollview
            .edgesIgnoringSafeArea(.top)
        } //: Navigation
    }
}

#Preview {
    FruitDetailView(fruit: fruitsData[0])
}
