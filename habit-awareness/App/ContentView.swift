//
//  ContentView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//


import SwiftUI

struct ContentView: View {

    @State private var onboardingCompleted = false

    @State private var habitsBank = HabitsBank()

    var body: some View {

        if onboardingCompleted {

            MainTabView()
                .environment(habitsBank)
            

        } else {

            OnboardingView(
                onFinished: { selectedHabits in

                    habitsBank.habits = selectedHabits
                    
                    withAnimation(.easeInOut(duration: 0.4)) {
                        onboardingCompleted = true
                    }
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
