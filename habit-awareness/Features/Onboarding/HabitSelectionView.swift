//
//  HabitSelectionView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 11/09/2026.
//

import SwiftUI

struct HabitSelectionView: View {

    @Binding var selectedHabits: [Habit]

    let onNext: () -> Void

    let availableHabits = [
        "doomscrolling",
        "alkohol",
        "impulsywne zakupy",
        "papierosy",
        "fast food",
        "granie w gry",
        "energetyki",
        "obgryzanie paznokci",
        "podjadanie",
        "słodycze"
    ]

    var body: some View {

        VStack {

            Spacer()

            VStack(alignment: .leading, spacing: 16) {

                Text("Co znowu\nrobisz?")
                    .font(.system(size: 56, weight: .bold))

                Text("Dodaj rzeczy, których robisz\nzdecydowanie za dużo.")
                    .font(.title3)
                    .foregroundStyle(.secondary)

                Text("A my policzymy. I tyle.")
                    .italic()
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()
                .frame(height: 36)

            ScrollView {

                FlowLayout(spacing: 12) {

                    ForEach(availableHabits, id: \.self) { habit in

                        let isSelected = selectedHabits.contains {
                            $0.title == habit
                        }

                        Button {

                            if isSelected {

                                selectedHabits.removeAll {
                                    $0.title == habit
                                }

                            } else {

                                selectedHabits.append(
                                    Habit(
                                        title: habit,
                                        count: 0,
                                        emoji: emojiForHabit(habit)
                                    )
                                )
                            }

                        } label: {

                            Text(habit)
                                .font(.headline)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 12)
                                .background(
                                    isSelected
                                    ? Color(hex: "#a99bc8")
                                    : .gray.opacity(0.18)
                                )
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 14)
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .frame(maxHeight: 300)
            .mask(
                LinearGradient(
                    stops: [
                        .init(color: .black, location: 0),
                        .init(color: .black, location: 0.75),
                        .init(color: .clear, location: 1)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )

            Spacer()

            Button("Dalej") {
                onNext()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(
                LinearGradient(
                    colors: [
                        Color(hex: "#c58fa3"),
                        Color(hex: "#a99bc8")
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .foregroundStyle(.black)
            .fontWeight(.bold)
            .clipShape(
                RoundedRectangle(cornerRadius: 16)
            )

            HStack(spacing: 10) {

                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(.gray)

                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(Color(hex: "#a99bc8"))

                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 16)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }


    private func emojiForHabit(_ habit: String) -> String {

        switch habit {

        case "doomscrolling":
            return "📱"

        case "alkohol":
            return "🍺"

        case "papierosy":
            return "🚬"

        case "fast food":
            return "🍔"

        case "granie w gry":
            return "🎮"

        case "energetyki":
            return "⚡️"

        case "obgryzanie paznokci":
            return "💅"

        case "podjadanie":
            return "🍿"

        case "słodycze":
            return "🍫"

        case "impulsywne zakupy":
            return "🛍️"

        default:
            return "⚪️"
        }
    }
}

#Preview {
    HabitSelectionView(
        selectedHabits: .constant([]),
        onNext: {
            print("Dalej")
        }
    )
}
