//
//  FooterView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 5/11/23.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundColor(.gray)
                .layoutPriority(0)
            
            Text("Copyright © Robert Petros.\nAll rights reserved.")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
        }
    }
}

#Preview {
    FooterView()
}
