//
//  AudioPlayerService.swift
//  BurnDetector
//
//  Created by Fran Alarza on 31/3/26.
//

import AVFoundation
import os

// MARK: - Protocol

protocol AudioPlayerServiceProtocol: Sendable {
    func playSound(named name: String) async
}

// MARK: - Implementation

final class AudioPlayerService: AudioPlayerServiceProtocol, @unchecked Sendable {

    private let logger = Logger(subsystem: "com.aweapps.BurnDetector", category: "AudioPlayer")
    private var player: AVAudioPlayer?

    func playSound(named name: String) async {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            logger.error("Audio file '\(name).mp3' not found in bundle")
            return
        }

        do {
            let player = try AVAudioPlayer(contentsOf: url)
            self.player = player
            player.play()
        } catch {
            logger.error("Failed to play sound '\(name)': \(error.localizedDescription)")
        }
    }
}
