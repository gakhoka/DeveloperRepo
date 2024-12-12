//
//  TimerModel.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 11.12.24.
//

import Foundation

struct TimerModel: Codable {
    let name: String
    let totalTimeInSeconds: Int
    let remainingTime: Int
}
