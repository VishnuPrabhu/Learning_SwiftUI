//
//  FeaturedTabView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 7/11/23.
//

import SwiftUI

struct FeaturedItemView: View {
    let player: Player
    
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    FeaturedItemView(player: players[0])
        .padding()
}
