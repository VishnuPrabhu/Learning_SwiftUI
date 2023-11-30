//
//  SoundPlayer.swift
//  Devote
//
//  Created by Vishnu Prabhu Rama Chandran on 30/11/23.
//

import Foundation
import AVFoundation

private var audioPlayer: AVAudioPlayer?

func playSound(_ sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}
