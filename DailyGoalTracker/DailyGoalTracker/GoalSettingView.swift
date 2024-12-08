//
//  GoalSettingView.swift
//  DailyGoalTracker
//
//  Created by Mustafa on 8.12.2024.
//

import SwiftUI

struct GoalSettingView: View {
    @Binding var goalInfo: GoalInfo?
    @State private var goalInput = ""
    @State private var targetInput = 0

    var body: some View {
        VStack(spacing: 15) {
            Text("What?")
            TextField("e.g. Push Up", text: $goalInput)
                .textFieldStyle(.roundedBorder)
            Text("How Many?")
            TextField("e.g. 50", value: $targetInput, format: .number)
                .textFieldStyle(.roundedBorder)
            Divider()
            HStack {
                Button("Start") {
                    goalInfo = GoalInfo(
                        name: goalInput,
                        target: targetInput,
                        numberOfRemainingTasks: targetInput
                    )
                    goalInput = ""
                    targetInput = 0
                }
                Button("Quit") {
                    NSApp.terminate(nil)
                }
            }
        }
        .font(.title2)
        .fontWeight(.semibold)
        .padding()
    }
}

#Preview {
    GoalSettingView(
        goalInfo: .constant(
            .init(
                name: "Push Up",
                target: 5,
                numberOfRemainingTasks: 5
            )
        )
    )
}
