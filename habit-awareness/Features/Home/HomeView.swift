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
        habitsBank.entries.count
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
                        onAddEntry: {
                            habitsBank.addEntry(for: habit.wrappedValue.id)
                        },
                        count: habitsBank.countEntries(for: habit.wrappedValue.id),
                        title: habit.wrappedValue.title,
                        onEdit: {
                            selectedHabit = habit.wrappedValue
                        },
                        emoji: habit.wrappedValue.emoji,
                        
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
    let bank = HabitsBank()

    bank.addHabit(
        Habit(title: "Doomscrolling", emoji: "📱")
    )

    bank.addHabit(
        Habit(title: "Słodycze", emoji: "🍫")
    )

    return HomeView()
        .environment(bank)
}
