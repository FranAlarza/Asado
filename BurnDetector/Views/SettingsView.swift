//
//  SettingsView.swift
//  BurnDetector
//
//  Created by Fran Alarza on 31/3/26.
//

import SwiftUI

struct SettingsView: View {
    @Bindable var settings: AppSettings
    private let audioPlayer: AudioPlayerServiceProtocol
    private let soundOptions = SoundOption.allBundled()

    // MARK: - Init

    init(settings: AppSettings, audioPlayer: AudioPlayerServiceProtocol = AudioPlayerService()) {
        self.settings = settings
        self.audioPlayer = audioPlayer
    }

    // MARK: - Body

    var body: some View {
        Form {
            Section("Alerts") {
                Toggle("Sound alerts", isOn: $settings.soundEnabled)

                HStack {
                    Picker("Alert sound", selection: $settings.selectedSound) {
                        ForEach(soundOptions) { option in
                            Text(option.displayName).tag(option.id)
                        }
                    }
                    .pickerStyle(.menu)

                    Button {
                        Task {
                            await audioPlayer.playSound(named: settings.selectedSound)
                        }
                    } label: {
                        Image(systemName: "speaker.wave.2")
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("CPU Threshold: \(settings.threshold)%")
                    Slider(
                        value: thresholdBinding,
                        in: 50...100,
                        step: 1
                    )
                }
            }
        }
        .formStyle(.grouped)
        .frame(width: 350, height: 200)
    }

    // MARK: - Private

    private var thresholdBinding: Binding<Double> {
        Binding(
            get: { Double(settings.threshold) },
            set: { settings.threshold = Int($0) }
        )
    }
}
