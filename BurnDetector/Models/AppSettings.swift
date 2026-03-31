//
//  AppSettings.swift
//  BurnDetector
//
//  Created by Fran Alarza on 31/3/26.
//

import Foundation

@Observable
final class AppSettings {

    // MARK: - Keys

    private enum Keys {
        static let threshold = "cpuThreshold"
        static let soundEnabled = "soundEnabled"
    }

    // MARK: - Defaults

    private static let defaultThreshold = 90
    private static let defaultSoundEnabled = true

    // MARK: - Properties

    var threshold: Int {
        didSet { UserDefaults.standard.set(threshold, forKey: Keys.threshold) }
    }

    var soundEnabled: Bool {
        didSet { UserDefaults.standard.set(soundEnabled, forKey: Keys.soundEnabled) }
    }

    // MARK: - Init

    init() {
        let defaults = UserDefaults.standard

        if defaults.object(forKey: Keys.threshold) != nil {
            self.threshold = defaults.integer(forKey: Keys.threshold)
        } else {
            self.threshold = Self.defaultThreshold
        }

        if defaults.object(forKey: Keys.soundEnabled) != nil {
            self.soundEnabled = defaults.bool(forKey: Keys.soundEnabled)
        } else {
            self.soundEnabled = Self.defaultSoundEnabled
        }
    }
}
