//
//  GoalInfo.swift
//  DailyGoalTracker
//
//  Created by Mustafa on 8.12.2024.
//

import Foundation

struct GoalInfo {
    var name: String
    var target: Int
    var numberOfRemainingTasks: Int
}

// MARK: - Codable
extension GoalInfo: Codable {
    enum CodingKeys: String, CodingKey {
        case name, target, remaining
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        target = try container.decode(Int.self, forKey: .target)
        numberOfRemainingTasks = try container.decode(Int.self, forKey: .remaining)
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(target, forKey: .target)
        try container.encode(numberOfRemainingTasks, forKey: .remaining)
    }
}

// MARK: - RawRepresentable
extension GoalInfo: RawRepresentable {
    init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(GoalInfo.self, from: data)
        else {
            return nil
        }
        self = result
    }

    var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else { return "[]" }

        return result
    }
}
