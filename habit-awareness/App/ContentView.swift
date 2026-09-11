//
//  ContentView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        /*
          !=== for future implementation ===!
         if onboardingCompleted {
            MainTabView()
        } else {
            OnboardingView()
        }
        
         */
        TabView {
            HomeView()
                .tabItem {
                    Label("Podsumowanie", systemImage: "house")
                }
            
            HistoryView()
                .tabItem {
                    Label("Statystyki", systemImage: "chart.xyaxis.line")
                }
            StatsView()
                .tabItem {
                    Label("Historia", systemImage: "clock.arrow.circlepath")
                }
        }
        .tint(.blue)
    }
}

#Preview {
    ContentView()
}
