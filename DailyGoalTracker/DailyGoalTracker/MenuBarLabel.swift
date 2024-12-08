//
//  MenuBarLabel.swift
//  DailyGoalTracker
//
//  Created by Mustafa on 8.12.2024.
//

import SwiftUI

struct MenuBarLabel: View {
    let goalInfo: GoalInfo?

    var body: some View {
        if let goalName = goalInfo?.name,
           let remaining = goalInfo?.numberOfRemainingTasks
        {
            if remaining > 0 {
                Text("Remaining \(goalName.pluralify(count: remaining)): \(remaining)")
            } else {
                Text("Goal reached 🎉")
            }
        } else {
            Text("Daily Goal Tracker")
        }
    }
}
