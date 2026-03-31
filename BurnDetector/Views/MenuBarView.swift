import SwiftUI

struct MenuBarView: View {
    @Bindable var viewModel: MenuBarViewModel

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

            // MARK: - Settings

            Toggle("Sound alerts", isOn: $viewModel.settings.soundEnabled)

            VStack(alignment: .leading, spacing: 4) {
                Text("Threshold: \(viewModel.settings.threshold)%")
                    .font(.caption)
                Slider(
                    value: thresholdBinding,
                    in: 50...100,
                    step: 1
                )
            }

            Divider()

            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
        .padding()
        .frame(width: 220)
    }

    // MARK: - Private

    private var cpuLabel: String {
        if let usage = viewModel.cpuUsage {
            return "CPU: \(usage)%"
        }
        return "CPU: --%"
    }

    private var thresholdBinding: Binding<Double> {
        Binding(
            get: { Double(viewModel.settings.threshold) },
            set: { viewModel.settings.threshold = Int($0) }
        )
    }
}
