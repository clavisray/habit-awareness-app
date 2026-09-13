//
//  ContentView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct ContentView: View {

    @State private var onboardingCompleted = false

    var body: some View {

        if onboardingCompleted {

            MainTabView()

        } else {

            OnboardingView(
                onFinished: {
                    onboardingCompleted = true
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
