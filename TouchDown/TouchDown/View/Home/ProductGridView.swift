//
//  ProductGridView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 7/11/23.
//

import SwiftUI

struct ProductGridView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: rowSpacing) {
            ForEach(products) { product in
                ProductItemView(product: product)
                    .onTapGesture {
                        feedback.impactOccurred()
                        withAnimation(.easeOut) {
                            shop.isShowingProduct = true
                            shop.selectedProduct = product
                        }
                    }
            }
        }//:LazyVGrid
        .padding(15)
    }
}

#Preview {
    ProductGridView()
        .environmentObject(Shop())
}
