//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 30/10/23.
//

import Foundation
import AVKit

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    var avPlayer: AVPlayer?
    if (Bundle.main.url(forResource: fileName, withExtension: fileFormat) != nil) {
        avPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileFormat)!)
        avPlayer!.play()
    }
    return avPlayer!
}
