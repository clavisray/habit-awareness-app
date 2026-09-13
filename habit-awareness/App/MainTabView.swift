//
//  MainTabView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 13/09/2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
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
    MainTabView()
}
