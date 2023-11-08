//
//  NavigationBarDetailView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 8/11/23.
//

import SwiftUI

struct NavigationBarDetailView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        HStack {
            Button(action: {
                feedback.impactOccurred()
                withAnimation(.easeOut) {
                    shop.isShowingProduct = false
                    shop.selectedProduct = nil
                }
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            })
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "cart")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            })
        }
    }
}

#Preview {
    NavigationBarDetailView()
        .background(.gray)
        .environmentObject(Shop())
}
