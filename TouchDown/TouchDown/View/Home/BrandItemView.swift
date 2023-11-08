//
//  BrandItemView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 8/11/23.
//

import SwiftUI

struct BrandItemView: View {
    let brand: Brand
    
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding(3)
            .background(Color.white.cornerRadius(12))
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}

#Preview {
    BrandItemView(brand: brands[0])
}
