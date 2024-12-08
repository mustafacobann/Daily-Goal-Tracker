//
//  String+Pluralify.swift
//  DailyGoalTracker
//
//  Created by Mustafa on 8.12.2024.
//

import Foundation

extension String {
    func pluralify(count: Int) -> Self {
        self + (count > 1 ? "s" : "")
    }
}
