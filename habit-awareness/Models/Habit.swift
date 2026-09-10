//
//  Habit.swift
//  habit-awareness
//
//  Created by Mateusz Boguszewski on 06/09/2026.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    var title: String
    var count: Int
}
