//
//  TimerModel.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 11.12.24.
//

import Foundation

struct TimerModel: Codable {
    var id = UUID()
    let name: String
    let totalTimeInSeconds: Int
    let remainingTime: Int
}

struct TimerActivity: Codable {
    var sessionCount: Int
    var date: Date
    var startHour: String
    var timeWorked: TimeInterval
}
