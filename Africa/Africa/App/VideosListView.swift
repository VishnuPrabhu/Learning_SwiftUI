//
//  VideosListView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 25/10/23.
//

import SwiftUI

struct VideosListView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    private let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItemView(video: video)
                            .padding(.vertical, 8)
                    }
                }
            } //:List
            .listStyle(.insetGrouped)
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        } //:NavigationView
    }
}

#Preview {
    VideosListView()
}
