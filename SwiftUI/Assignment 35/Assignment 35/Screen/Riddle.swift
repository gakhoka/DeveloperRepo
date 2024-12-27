//
//  Riddle.swift
//  Assignment 35
//
//  Created by Giorgi Gakhokidze on 27.12.24.
//

import Foundation

struct Riddle {
    let emojis: String
    let answers: [String]
    let reward: Int
    let level: Int
    let hint: String
    let correctAnswer: String
}

struct RiddleCategory {
    let name: String
    let riddles: [Riddle]
}

