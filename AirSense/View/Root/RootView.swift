//
//  RootView.swift
//  AirSense
//
//  Created by Andrii Duda on 19.10.2026.
//

import SwiftUI

struct RootView: View {
    @Environment(NavigationManager.self) private var navigation

    var body: some View {
        switch navigation.appState {
        case .launch: LaunchView()
        case .onboarding: OnboardingView()
        case .home: Text("Home")
        }
    }
}
