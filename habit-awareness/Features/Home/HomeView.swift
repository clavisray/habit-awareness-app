//
//  HomeView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct HomeView: View {

    @State private var newEvent = ""

    @Environment(HabitsBank.self) private var habitsBank
    
    @State private var selectedHabit: Habit?

    @FocusState private var isTextFieldFocused: Bool

    private var totalCount: Int {
        habitsBank.habits.reduce(0) { sum, habit in
            sum + habit.count
        }
    }

    var body: some View {
        
        @Bindable var bank = habitsBank

        VStack(alignment: .leading, spacing: 12) {

            Text("Dzisiaj")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
                .padding(.leading, 16)

            Text("\(totalCount) odnotowanych zdarzeń")
                .padding(.horizontal)

            List {

                ForEach($bank.habits) { habit in

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

                            habitsBank.addHabit(
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

            if let index = habitsBank.habits.firstIndex(
                where: { $0.id == selectedHabit.id }
            ) {
                HabitDetailView(
                    title: $bank.habits[index].title
                )
                .presentationDetents([.medium])
            }
        }
    }

    private func deleteHabits(at offsets: IndexSet) {
        habitsBank.habits.remove(atOffsets: offsets)
    }
}

#Preview {
    HomeView()
        .environment(HabitsBank())
}
