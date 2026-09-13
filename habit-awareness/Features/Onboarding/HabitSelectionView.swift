//
//  HabitSelectionView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 11/09/2026.
//

import SwiftUI

struct HabitSelectionView: View {

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

                Text("Co znowu?")
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

                        Text(habit)
                            .font(.headline)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(.gray.opacity(0.18))
                            .clipShape(
                                RoundedRectangle(cornerRadius: 14)
                            )
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

            Button("Dodaj swój pierwszy nawyk") {
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
                    .foregroundStyle(
                        Color(hex: "#a99bc8")
                    )

                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 16)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }
}

#Preview {
    HabitSelectionView(
        onNext: {
            print("Dalej")
        }
    )
}
