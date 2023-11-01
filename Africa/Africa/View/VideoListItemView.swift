//
//  VideoListItemView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 30/10/23.
//

import SwiftUI

struct VideoListItemView: View {
    let video: Video
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //:ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //:VStack
        } //:HStack
    }
}

#Preview {
    Group {
        let videos: [Video] = Bundle.main.decode("videos.json")
        VideoListItemView(video: videos[0])
    }
}
