//
//  HomeView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct HomeView: View {
    
    @State private var count = 0
    
    @State private var newEvent = ""
    
    @State private var habits: [Habit] = [
        Habit(title: "Podjadanie", count: 0),
        Habit(title: "Słodycze", count: 0),
        Habit(title: "Doomscrolling", count: 0),
        Habit(title: "Papierosy", count: 0)
    ]
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .leading, spacing: 12) {
                
                if !newEvent.isEmpty {
                    HStack {
                        Spacer()

                        Button {
                            habits.append(
                                Habit(
                                    title: newEvent,
                                    count: 0
                                )
                            )

                            newEvent = ""
                        } label: {
                            Image(systemName: "checkmark")
                                .frame(width: 40, height: 40)
                                .background(Color.blue)
                                .foregroundStyle(.white)
                                .clipShape(Circle())
                        }
                    }
                }
                
                Text("Today")
                
                ForEach($habits) {
                    habit in
                    HabitCardView(
                        title: habit.wrappedValue.title,
                        count: habit.count
                    )
                }
                
                HStack{
                    
                    TextField(
                        "Dodaj nowy nawyk",
                        text: $newEvent
                    )
                    
                    if !newEvent.isEmpty {
                        Button("+") {
                            habits.append(
                                    Habit(
                                        title: newEvent,
                                        count: 0
                                    )
                            )
                            newEvent = ""
                        }
                        .frame(width: 40, height: 40)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                    }
                    
                }
                
                            
                /*
                 Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "plus")
                        Text("Dodaj nawyk")
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 48)
                .padding(.horizontal)
                .background(.gray.opacity(0.12))
                .foregroundStyle(.primary)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                 */
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }
    }
    
}

#Preview {
    HomeView()
}
