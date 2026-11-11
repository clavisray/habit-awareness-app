//
//  WelcomeStepView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 11/09/2026.
//

import SwiftUI

struct WelcomeStepView: View {
    let onNext: () -> Void
    
    var body : some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 24) {
                Text("znowu?")
                    .font(.system(size: 80, weight: .bold))
                    .italic()
                HStack {
                    Text("twoje złe nawyki są")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    Text("policzone")
                        .italic()
                }
                
            }
            
            Spacer()
            
            Button("Dalej") {
                onNext()
            }
            .font(.system(size: 20, weight: .medium))
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .frame(height: 54)
            .contentShape(Rectangle())
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
            .foregroundStyle(.primary)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .buttonStyle(.plain)
            
            HStack(spacing: 10) {
                Circle()
                    .frame(width: 8, height: 8)

                Circle()
                    .frame(width: 8, height: 8)

                Circle()
                    .frame(width: 8, height: 8)
            }
            .padding(.top, 16)
            
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 24)
    }
}

#Preview {
    WelcomeStepView(
        onNext: {
            print("Dalej")
        }
    )
}
