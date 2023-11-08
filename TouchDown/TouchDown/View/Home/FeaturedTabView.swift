//
//  FeaturedTabView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 7/11/23.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

#Preview {
    ScrollView {
        VStack {
            FeaturedTabView()
                .frame(height: UIScreen.main.bounds.width / 1.475) 
                .background(.green)
        }
    }
}
