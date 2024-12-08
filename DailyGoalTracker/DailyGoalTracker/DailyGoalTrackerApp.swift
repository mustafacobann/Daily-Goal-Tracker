//
//  DailyGoalTrackerApp.swift
//  DailyGoalTracker
//
//  Created by Mustafa on 7.12.2024.
//

import SwiftUI

@main
struct DailyGoalTrackerApp: App {
    // Storing data in UserDefaults?! Calm down 10x developer, this is a hobby project.
    @AppStorage("goalInfo") var goalInfo: GoalInfo?

    var body: some Scene {
        MenuBarExtra {
            if goalInfo != nil {
                GoalTrackingView(goalInfo: $goalInfo)
            } else {
                GoalSettingView(goalInfo: $goalInfo)
            }
        } label: {
            MenuBarLabel(goalInfo: goalInfo)
        }
        .menuBarExtraStyle(.window)
    }
}
