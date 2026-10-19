//
//  LaunchViewModel.swift
//  AirSense
//
//  Created by Andrii Duda on 19.10.2026.
//

import Foundation
import Observation

@Observable

final class LaunchViewModel {
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            ?? "1.0"
    }

    var progress: Double = 0

    func load() async throws {
        for step in [0.3, 0.6, 0.85, 1.0] {
            try? await Task.sleep(for: .milliseconds(400))
            progress = step
            
        }
    }
}
