//
//  HowItWorksView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 11/09/2026.
//

import SwiftUI

struct HowItWorksView: View {
    let onNext: () -> Void
    
    
    var body : some View {
        VStack {
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("znowu \nci się zdarzyło?")
                    .font(.system(size: 40, weight: .bold))

                Text("A my policzymy każde znowu \n i pokażemy ci, ile tego naprawdę jest.")
                    .font(.title3)
                    .foregroundStyle(Color(hex: "262629"))
                Text("pamięć odpuszcza, liczby nie.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
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
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
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
    HowItWorksView(onNext: {
        print("Dalej")
    })
}
