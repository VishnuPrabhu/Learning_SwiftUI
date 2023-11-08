//
//  ProductItemView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 7/11/23.
//

import SwiftUI

struct ProductItemView: View {
    let product:Product
    
    var body: some View {
        VStack {
            ZStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .background(Color(red: product.red, green: product.green, blue: product.blue))
            .cornerRadius(12)
            
            Text(product.name)
                .font(.title3)
                .fontWeight(.black)
            
            Text(product.formattedPrice)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
        }//:VStack
    }
}

#Preview {
    ProductItemView(product: products[0])
        .padding()
}
