//
//  Model.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//

import Foundation

struct QuizQuestion: Codable {
    let question: String
    let difficulty: String
    let category: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case question
        case difficulty
        case category
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}
