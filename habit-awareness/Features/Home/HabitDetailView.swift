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
    @State var editedTitle: String
    
    init(title: Binding<String>) {
        self._title = title
        self._editedTitle = State(initialValue: title.wrappedValue)
    }

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
                        let trimmedTitle = editedTitle.trimmingCharacters(in: .whitespacesAndNewlines)

                        if !trimmedTitle.isEmpty {
                            title = trimmedTitle
                            dismiss()
                        }
                    }
                }
            .padding()
            
            Text("Uzupełnij dane nawyku")
                .font(.title)
                .padding()
            
                Spacer()
                
                
                
                TextField(
                    "Dodaj nowy nawyk",
                    text: $editedTitle
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
    HabitDetailView(title: .constant("Podjadanie"))
}
