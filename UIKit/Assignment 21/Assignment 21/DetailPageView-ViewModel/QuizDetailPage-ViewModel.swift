//
//  QuizDetailPage-ViewModel.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 04.11.24.
//

import Foundation
 

class QuizDetailViewModel  {
    private var correctScore = 0
    private var incorrectScore = 0
    
    var correctScoreChanged: (() -> Void)?
    var incorrectScoreChanged: (() -> Void)?
    
    func loadScores() {
        correctScore = UserDefaults.standard.integer(forKey: "correctScore")
        incorrectScore = UserDefaults.standard.integer(forKey: "incorrectScore")
        notifyScoreChange()
    }
    
    func buttonTapped(withAnswer answer: String, correctAnswer: String) {
        if answer == correctAnswer {
            correctScore += 1
        } else {
            incorrectScore += 1
        }
        saveScores()
        notifyScoreChange()
    }
    
    func resetScores() {
        correctScore = 0
        incorrectScore = 0
        notifyScoreChange()
        saveScores()
    }
    
    private func notifyScoreChange() {
        correctScoreChanged?()
        incorrectScoreChanged?()
    }
    
    private func saveScores() {
        UserDefaults.standard.set(correctScore, forKey: "correctScore")
        UserDefaults.standard.set(incorrectScore, forKey: "incorrectScore")
    }
    
    var correctAnswersText: String {
        return "Correct answers: \(correctScore)"
    }
    
    var incorrectAnswersText: String {
        return "Incorrect: \(incorrectScore)"
    }
}
