//
//  OnboardingView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 11/09/2026.
//

import SwiftUI

struct OnboardingView: View {

    @State private var currentStep = 0
    @State private var selectedHabits: [Habit] = []

    let onFinished: ([Habit]) -> Void

    var body: some View {

        TabView(selection: $currentStep) {

            WelcomeStepView(
                onNext: {
                    currentStep += 1
                }
            )
            .tag(0)

            HowItWorksView(
                onNext: {
                    currentStep += 1
                }
            )
            .tag(1)

            HabitSelectionView(
                selectedHabits: $selectedHabits,
                onNext: {
                    onFinished(selectedHabits)
                }
            )
            .tag(2)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

#Preview {
    OnboardingView(
        onFinished: { habits in
            print(habits)
        }
    )
}
