//
//  BurnDetectorApp.swift
//  BurnDetector
//
//  Created by Fran Alarza on 31/3/26.
//

import SwiftUI

@main
struct BurnDetectorApp: App {
    @State private var viewModel = MenuBarViewModel()

    var body: some Scene {
        MenuBarExtra("Burn Detector", systemImage: "flame.fill") {
            MenuBarView(viewModel: viewModel)
        }
        .menuBarExtraStyle(.window)

        Settings {
            SettingsView(settings: viewModel.settings)
        }
    }
}
