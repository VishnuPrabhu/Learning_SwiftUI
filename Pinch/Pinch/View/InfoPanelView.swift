//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Vishnu Prabhu Rama Chandran on 19/10/23.
//

import SwiftUI

struct InfoPanelView: View {
    var imageScale: CGFloat
    var imageOffset: CGSize
    
    @State private var isInfoPanelVisible = false
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                }
            
            Spacer()
            
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(imageScale)")
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(imageOffset.width)")
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(imageOffset.height)")
                Spacer()
            }
            .opacity(isInfoPanelVisible ? 1 : 0)
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            
            Spacer()
        }
    }
}

#Preview {
    InfoPanelView(imageScale: 1, imageOffset: .zero)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
}
