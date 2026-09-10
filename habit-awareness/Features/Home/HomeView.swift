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
        Habit(title: "Podjadanie", count: 0, emoji: "🍔"),
        Habit(title: "Słodycze", count: 0, emoji: "🍫"),
        Habit(title: "Doomscrolling", count: 0, emoji: "📱"),
        Habit(title: "Papierosy", count: 0, emoji: "🚬")
    ]

    @State private var selectedHabit: Habit?

    private var totalCount: Int {
        habits.reduce(0) { sum, habit in
            sum + habit.count
        }
    }

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Dzisiaj")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
                .padding(.leading, 16)

            Text("\(totalCount) odnotowanych zdarzeń")
                .padding(.horizontal)

            List {

                ForEach($habits) { habit in

                    HabitCardView(
                        title: habit.wrappedValue.title,
                        count: habit.count,
                        onEdit: {
                            selectedHabit = habit.wrappedValue
                        },
                        emoji: habit.wrappedValue.emoji
                    )
                    .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteHabits)
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
                                    count: 0,
                                    emoji: "⚪️"
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

    private func deleteHabits(at offsets: IndexSet) {
        habits.remove(atOffsets: offsets)
    }
}

#Preview {
    HomeView()
}
