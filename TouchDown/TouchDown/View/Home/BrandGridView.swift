//
//  BrandGridView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 8/11/23.
//

import SwiftUI

struct BrandGridView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: gridLayout, spacing: columnSpacing) {
                ForEach(brands) { brand in
                    BrandItemView(brand: brand)
                }
            }//:LazyGridView
        }
        .frame(height: 200)
        .padding(15)
    }
}

#Preview {
    BrandGridView()
}
