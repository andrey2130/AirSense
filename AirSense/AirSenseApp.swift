//
//  AirSenseApp.swift
//  AirSense
//
//  Created by Andrii Duda on 19.10.2026.
//

import SwiftUI

@main
struct AirSenseApp: App {
    @State private var navigation = NavigationManager()
   
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environment(navigation)
    }
}
