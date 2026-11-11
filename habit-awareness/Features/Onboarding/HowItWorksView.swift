//
//  HowItWorksView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 11/09/2026.
//


import SwiftUI

struct HowItWorksView: View {

    let onNext: () -> Void

    private let pink = Color(hex: "#c58fa3")
    private let purple = Color(hex: "#a99bc8")

    private var gradient: LinearGradient {
        LinearGradient(
            colors: [pink, purple],
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    var body: some View {

        VStack {
            Spacer()

            VStack(alignment: .leading, spacing: 4) {

                Text("ZNOWU")
                    .font(.system(size: 42, weight: .black))
                    .italic()
                    .foregroundStyle(gradient)

                Text("ci się zdarzyło \(Text("?").foregroundColor(purple).font(.system(size: 47, weight: .bold)))")
                    .font(.system(size: 43, weight: .regular))
                    .foregroundStyle(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 48)

            HStack(spacing: 16) {

                Text("Kliknij \(Text("+").bold()) przy twoim nawyku")
                    .font(.system(size: 21, weight: .ultraLight))
                    .italic()
                    .foregroundStyle(.primary)

                Spacer(minLength: 0)

                Image(systemName: "plus")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(.primary)
                    .frame(width: 54, height: 54)
                    .background(gradient)
                    .clipShape(Circle())
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 22)
            .background(Color(uiColor: .secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.bottom, 42)

            VStack(alignment: .leading, spacing: 20) {

                Text("A my policzymy każde \(Text("znowu").bold())\ni pokażemy ci, ile tego naprawdę jest.")
                    .font(.system(size: 25, weight: .light))
                    .italic()
                    .foregroundStyle(.primary)
                    .fixedSize(horizontal: false, vertical: true)

                Text("pamięć odpuszcza. liczby nie.")
                    .font(.system(size: 17, weight: .ultraLight))
                    .italic()
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Button(action: onNext) {
                Text("Dalej")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .contentShape(Rectangle())
                    .background(gradient)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .buttonStyle(.plain)

            HStack(spacing: 10) {
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(.gray)

                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(.gray)

                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundStyle(purple)
            }
            .padding(.top, 16)

        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }
}

#Preview {
    HowItWorksView(onNext: {})
}
