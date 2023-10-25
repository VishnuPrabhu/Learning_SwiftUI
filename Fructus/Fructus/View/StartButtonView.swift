//
//  StartButtonView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 22/10/23.
//

import SwiftUI

struct StartButtonView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        Button(action: {
            isOnboarding = false
        }) {
            HStack(spacing: 8) {
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .strokeBorder(.white, lineWidth: 1.25)
            )
        } //: Button
        .accentColor(.white)
    }
}

#Preview {
    StartButtonView()
        .previewLayout(.sizeThatFits)
}
