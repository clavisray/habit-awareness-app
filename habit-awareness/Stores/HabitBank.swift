//
//  HabitBank.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 10/11/2026.
//

import Observation
import Foundation

@Observable
class HabitsBank {
    var habits: [Habit] = []
    var entries: [HabitEntry] = []
    
    // New habbit to the bank
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
    
    // Saving new entries per habit with date
    func addEntry(for habitId: UUID) {
        let entry = HabitEntry(
            habitId: habitId,
            createdAt: Date()
        )
        entries.append(entry)
    }
    
    // Sum of entries per habit
    func countEntries(for habitId: UUID) -> Int {
        entries.filter { $0.habitId == habitId }.count
    }
}
