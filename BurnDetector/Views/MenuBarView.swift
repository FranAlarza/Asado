import SwiftUI

struct MenuBarView: View {

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("BurnDetector")
                .font(.headline)

            Text("CPU: --%")
                .font(.body)
                .foregroundStyle(.secondary)

            Divider()

            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
        .frame(width: 200)
    }
}

#Preview {
    MenuBarView()
}
