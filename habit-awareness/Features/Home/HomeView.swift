//
//  HomeView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct HomeView: View {

    @State private var newEvent = ""

    @State private var habits: [Habit] = [
        Habit(title: "Podjadanie", count: 0),
        Habit(title: "Słodycze", count: 0),
        Habit(title: "Doomscrolling", count: 0),
        Habit(title: "Papierosy", count: 0)
    ]

    @State private var selectedHabit: Habit?

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Today")
                .padding(.horizontal)

            List {
                ForEach($habits) { habit in

                    Button {
                        selectedHabit = habit.wrappedValue
                    } label: {

                        HabitCardView(
                            title: habit.wrappedValue.title,
                            count: habit.count
                        )

                    }
                    .buttonStyle(.plain)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)

            HStack {
                TextField(
                    "Dodaj nowy nawyk",
                    text: $newEvent
                )

                if !newEvent.isEmpty {

                    Button("+") {

                        let trimmedTitle = newEvent
                            .trimmingCharacters(in: .whitespacesAndNewlines)

                        if !trimmedTitle.isEmpty {

                            habits.append(
                                Habit(
                                    title: trimmedTitle,
                                    count: 0
                                )
                            )

                            newEvent = ""
                        }
                    }
                    .frame(width: 40, height: 40)
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(Circle())
                }
            }
            .padding()
        }

        .sheet(item: $selectedHabit) { selectedHabit in

            if let index = habits.firstIndex(
                where: { $0.id == selectedHabit.id }
            ) {

                HabitDetailView(
                    title: $habits[index].title
                )
                .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    HomeView()
}
