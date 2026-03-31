import Foundation
import Testing
@testable import BurnDetector

// MARK: - Mock Service

struct MockCPUMonitoringService: CPUMonitoringServiceProtocol {
    let results: [Result<Double, Error>]

    func cpuUsageStream(interval: TimeInterval) -> AsyncStream<Result<Double, Error>> {
        AsyncStream { continuation in
            for result in results {
                continuation.yield(result)
            }
            continuation.finish()
        }
    }
}

// MARK: - Tests

struct MenuBarViewModelTests {

    @Test @MainActor
    func successUpdatesUsage() async throws {
        let service = MockCPUMonitoringService(results: [.success(42.3)])
        let viewModel = MenuBarViewModel(service: service)

        // Allow the async stream to deliver
        try await Task.sleep(for: .milliseconds(100))

        #expect(viewModel.cpuUsage == 42)
        #expect(viewModel.permissionsError == false)
    }

    @Test @MainActor
    func failureSetsPermissionsError() async throws {
        let service = MockCPUMonitoringService(results: [.failure(CPUMonitoringError.permissionDenied)])
        let viewModel = MenuBarViewModel(service: service)

        try await Task.sleep(for: .milliseconds(100))

        #expect(viewModel.cpuUsage == nil)
        #expect(viewModel.permissionsError == true)
    }

    @Test @MainActor
    func successAfterFailureClearsError() async throws {
        let service = MockCPUMonitoringService(results: [
            .failure(CPUMonitoringError.permissionDenied),
            .success(75.6)
        ])
        let viewModel = MenuBarViewModel(service: service)

        try await Task.sleep(for: .milliseconds(100))

        #expect(viewModel.cpuUsage == 76)
        #expect(viewModel.permissionsError == false)
    }

    @Test @MainActor
    func usageRoundsToNearestInt() async throws {
        let service = MockCPUMonitoringService(results: [.success(99.5)])
        let viewModel = MenuBarViewModel(service: service)

        try await Task.sleep(for: .milliseconds(100))

        #expect(viewModel.cpuUsage == 100)
    }
}
