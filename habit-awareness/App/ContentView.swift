//
//  ContentView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI
import SwiftUI

struct ContentView: View {

    @State private var onboardingCompleted = false

    @State private var habits: [Habit] = []

    var body: some View {

        if onboardingCompleted {

            MainTabView(
                habits: habits
            )

        } else {

            OnboardingView(
                onFinished: { selectedHabits in

                    habits = selectedHabits
                    onboardingCompleted = true
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
