//
//  ViewModel.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//

import Foundation

class QuizViewModel {
    var quiz: [QuizQuestion] = Bundle.main.decode("Questions.json")
    
    var quizCount: Int {
        quiz.count
    }
}
