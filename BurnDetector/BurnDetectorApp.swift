import SwiftUI

@main
struct BurnDetectorApp: App {
    var body: some Scene {
        MenuBarExtra("BurnDetector", systemImage: "flame.fill") {
            MenuBarView()
        }
        .menuBarExtraStyle(.window)
    }
}
