//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Vishnu Prabhu Rama Chandran on 29/11/23.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("rocket")
            .antialiased(true)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
    }
}

#Preview {
    BackgroundImageView()
}
