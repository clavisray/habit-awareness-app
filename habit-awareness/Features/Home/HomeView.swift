//
//  HomeView.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import SwiftUI

struct HomeView: View {
    
    @State private var count1 = 0;
    @State private var count2 = 0;
    @State private var count3 = 0;
    @State private var count4 = 0;
    
    @State private var newEvent = ""
    
    @State private var habits: [Habit] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            if !newEvent.isEmpty {
                Image(systemName: "checkmark")
                    .frame(width: 40, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            
            Text("Today")
                        
            HabitCardView(
                title: "Podjadanie",
                count: $count1
            )
            
            HabitCardView(
                title: "Słodycze",
                count: $count2
            )
            
            HabitCardView(
                title: "Doomscrolling",
                count: $count3
            )
            
            HabitCardView(
                title: "Papierosy",
                count: $count4
            )
            
            ForEach(habits) {
                habit in
                HabitCardView(
                    title: habit.title,
                    count: $count1
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

#Preview {
    HomeView()
}
