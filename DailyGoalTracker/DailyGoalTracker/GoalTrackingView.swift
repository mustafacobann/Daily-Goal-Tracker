//
//  GoalTrackingView.swift
//  DailyGoalTracker
//
//  Created by Mustafa on 8.12.2024.
//

import SwiftUI

struct GoalTrackingView: View {
    @Binding var goalInfo: GoalInfo?

    var formattedGoal: String {
        guard let goalName = goalInfo?.name, let target = goalInfo?.target
        else { return "" }
        return "\(target) " + goalName.pluralize(count: target)
    }

    var body: some View {
        VStack(spacing: 15) {
            Text("Goal: \(formattedGoal)")
            Divider()
            if let remaining = goalInfo?.numberOfRemainingTasks, remaining > 0 {
                Text("Remaining: \(remaining)")
                Button {
                    goalInfo?.numberOfRemainingTasks = remaining - 1
                } label: {
                    Text("Decrement")
                }
            } else {
                Text("Done 🎉")
            }
            Divider()
            HStack {
                Button("Reset") {
                    goalInfo = nil
                }
                Button("Quit") { NSApp.terminate(nil) }
            }
        }
        .font(.title2)
        .fontWeight(.semibold)
        .padding()
    }
}

#Preview {
    GoalTrackingView(
        goalInfo: .constant(
            .init(
                name: "Push Up",
                target: 5,
                numberOfRemainingTasks: 5
            )
        )
    )
}
