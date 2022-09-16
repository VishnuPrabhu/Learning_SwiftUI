//
//  AudioPlayer.swift
//  Restart
//
//  Created by Vishnu Prabhu Rama Chandran on 16/9/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Couldn't play the sound file.")
        }
    }
}
