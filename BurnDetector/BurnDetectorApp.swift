import SwiftUI

@main
struct BurnDetectorApp: App {
    @State private var viewModel = MenuBarViewModel()

    var body: some Scene {
        MenuBarExtra("BurnDetector", systemImage: "flame.fill") {
            MenuBarView(viewModel: viewModel)
        }
        .menuBarExtraStyle(.window)

        Settings {
            SettingsView(settings: viewModel.settings)
        }
    }
}
