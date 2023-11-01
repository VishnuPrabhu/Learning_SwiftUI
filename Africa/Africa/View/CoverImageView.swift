//
//  CoverImageView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 27/10/23.
//

import SwiftUI

struct CoverImageView: View {
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        } //: TabView
        .tabViewStyle(.page)
    }
}

#Preview {
    CoverImageView()
}
