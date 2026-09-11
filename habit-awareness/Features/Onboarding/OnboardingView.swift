//
//  OnboardingView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 11/09/2026.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep: Int = 0
    
    var body : some View {
        TabView(selection: $currentStep) {
            WelcomeStepView(onNext: {
                currentStep += 1
            })
                .tag(0)
            
            HabitSelectionView(onNext: {
                currentStep += 1
            })
                .tag(1)
            
            HowItWorksView(onNext: {
                currentStep += 1
            })
                .tag(2)
            
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    OnboardingView()
}
