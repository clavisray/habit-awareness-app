//
//  HabitDetailView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 07/09/2026.
//

import SwiftUI

struct HabitDetailView: View {
    @Binding var title: String
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                
                Spacer()
                
                    Button("Zapisz") {
                        
                    }
                }
            .padding()
            
            Text("Uzupełnij dane nawyku")
                .font(.title)
                .padding()
            
                Spacer()
                
                
                
                TextField(
                    "Dodaj nowy nawyk",
                    text: $title
                )
                .padding()
                .background(.gray.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
                Spacer()
            
            }
            .padding()
        }
    }


#Preview {
    HabitDetailView(title: .constant("nowy"))
}
