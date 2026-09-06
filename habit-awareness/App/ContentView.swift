//
//  ContentView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Podsumowanie", systemImage: "house")
                }
            
            HistoryView()
                .tabItem {
                    Label("Treningi", systemImage: "figure.strengthtraining.traditional")
                }
            StatsView()
                .tabItem {
                    Label("Historia treningów", systemImage: "clock.arrow.circlepath")
                }
        }
        .tint(.blue)
    }
}

#Preview {
    ContentView()
}
