//
//  MainTabView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 13/09/2026.
//

import SwiftUI

struct MainTabView: View {

    let habits: [Habit]

    var body: some View {

        TabView {

            HomeView(
                initialHabits: habits
            )
            .tabItem {
                Label(
                    "Podsumowanie",
                    systemImage: "house"
                )
            }


            HistoryView()
                .tabItem {
                    Label(
                        "Statystyki",
                        systemImage: "chart.xyaxis.line"
                    )
                }


            StatsView()
                .tabItem {
                    Label(
                        "Historia",
                        systemImage: "clock.arrow.circlepath"
                    )
                }
        }
        .tint(.blue)
    }
}

#Preview {
    MainTabView(
        habits: [
            Habit(
                title: "doomscrolling",
                count: 2,
                emoji: "📱"
            ),
            Habit(
                title: "papierosy",
                count: 1,
                emoji: "🚬"
            )
        ]
    )
}
