//
//  NavigationManager.swift
//  AirSense
//
//  Created by Andrii Duda on 19.10.2026.
//

import Foundation
import Observation

@Observable
final class NavigationManager {
    var appState: AppState = .launch
    
    
    func finishLauch() {
        appState = .onboarding
    }
}
