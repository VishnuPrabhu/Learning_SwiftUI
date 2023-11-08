//
//  ContentView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 5/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        ZStack {
            if shop.isShowingProduct == false && shop.selectedProduct == nil {
                VStack(spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.top, UIApplication.shared.windows/*keyWindow*/.first?.safeAreaInsets.top)
                        .background(.white)
                        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 5)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            
                            FeaturedTabView()
                                .frame(height: UIScreen.main.bounds.width / 1.475)
                                .padding(.vertical, 20)
                            
                            CategoryGridView()
                        
                            TitleView(title: "Helmet")
                            
                            ProductGridView()
                            
                            TitleView(title: "Brands")
                            
                            BrandGridView()
                        
                            ProductGridView()
                            
                            FooterView()
                                .padding()
                            
                        }//:VStack
                    }//:ScrollView
                }//:VStack
                .background(colorBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }//:ZStack
        .ignoresSafeArea(.all, edges: .top)
        
    }
}

#Preview {
    ContentView()
        .environmentObject(Shop())
}
