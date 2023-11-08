//
//  SectionView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 7/11/23.
//

import SwiftUI

struct SectionView: View {
    
    var rotateClockwise: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .rotationEffect(Angle(degrees: rotateClockwise ? 90 : -90))
                        
            Spacer()
        }
        .background(colorGray.cornerRadius(12))
        .frame(width: 85)
    }
}

#Preview {
    SectionView()
        .padding()
        .background(colorBackground)
}
