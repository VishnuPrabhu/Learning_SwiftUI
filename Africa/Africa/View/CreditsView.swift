//
//  CreditsView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 2/11/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
            Copyright © Robert Petros
            All rights reserved
            Better Apps ♡ Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.leading)
        } //:VStack
        .padding()
        .opacity(0.4)
    }
}

#Preview {
    CreditsView()
}
