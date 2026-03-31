import SwiftUI

struct MenuBarView: View {
    let viewModel: MenuBarViewModel

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("BurnDetector")
                .font(.headline)

            Text(cpuLabel)
                .font(.body)
                .foregroundStyle(.secondary)

            if viewModel.permissionsError {
                Text("Permissions required to read CPU usage")
                    .font(.caption)
                    .foregroundStyle(.red)
            }

            Divider()

            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
        .frame(width: 200)
    }

    // MARK: - Private

    private var cpuLabel: String {
        if let usage = viewModel.cpuUsage {
            return "CPU: \(usage)%"
        }
        return "CPU: --%"
    }
}
