//
//  HabitBank.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 10/11/2026.
//

import Observation

@Observable
class HabitsBank {
    var habits: [Habit] = []
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
}
