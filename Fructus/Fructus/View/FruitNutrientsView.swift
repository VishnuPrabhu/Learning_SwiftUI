//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 23/10/23.
//

import SwiftUI

struct FruitNutrientsView: View {
    let fruit: Fruit
    private let nutrients = ["Energy", "Sugar", "Fat", "Protein", "Vitamin", "Minerals"]
    var body: some View {
        GroupBox {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.body.bold())
                        Spacer(minLength: 25)
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                } //: ForEach
            } //: DisclosureGroup
        }
    }
}

#Preview {
    FruitNutrientsView(fruit: fruitsData[0])
}
