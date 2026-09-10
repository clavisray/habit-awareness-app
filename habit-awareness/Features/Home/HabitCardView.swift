//
//  StatsView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct HabitCardView: View {

    let title: String
    @Binding var count: Int
    let onEdit: () -> Void
    let emoji: String

    var body: some View {
        HStack {
            Text(emoji)
                .font(.system(size: 30))
            
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)

                Text("Dzisiaj \(count)")
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button("+") {
                count += 1
            }
            .frame(width: 40, height: 40)
            .background(Color.blue)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .buttonStyle(.borderless)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onEdit()
        }
        .padding()
        .background(.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    HabitCardView(title: "Przejadanie",
                  count: .constant(2),
                  onEdit: {},
                  emoji: "⚪️"
    )
}
