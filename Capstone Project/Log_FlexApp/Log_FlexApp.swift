//
//  Capstone_ProjectApp.swift
//  Capstone Project
//
//  Created by Avery Roth on 11/12/23.
//

import SwiftUI

@main
struct Capstone_ProjectApp: App {
    @AppStorage("showOnboarding") private var showOnboarding: Bool = true

    var body: some Scene {
        WindowGroup {
            if showOnboarding {
                OnboardingScreen()
            } else {
                ContentView()
            }
        }
    }
}
