//
//  AsadoApp.swift
//  Asado
//
//  Created by Fran Alarza on 31/3/26.
//

import SwiftUI

@main
struct AsadoApp: App {
    @State private var viewModel = MenuBarViewModel()

    var body: some Scene {
        MenuBarExtra("Asado", systemImage: "flame.fill") {
            MenuBarView(viewModel: viewModel)
        }
        .menuBarExtraStyle(.window)

        Settings {
            SettingsView(settings: viewModel.settings)
        }
    }
}
