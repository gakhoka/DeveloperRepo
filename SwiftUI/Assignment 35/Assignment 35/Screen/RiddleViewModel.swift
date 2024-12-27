//
//  RiddleViewModel.swift
//  Assignment 35
//
//  Created by Giorgi Gakhokidze on 27.12.24.
//


import Foundation
import UIKit

class RiddleViewModel: ObservableObject {
    @Published var categories: [RiddleCategory] = []
    @Published var currentCategoryIndex = 0
    @Published var currentRiddleIndex = 0
    @Published var alertMessage = ""
    @Published var showAlert = false
    @Published var hintMessage = ""
    @Published var isCorrect = false
    @Published var message = ""
    @Published var lives = 3
    @Published var correctAnswer = 0
    @Published var isLifeDeducting = false
    @Published var coins = 0 {
        didSet {
            UserDefaults.standard.set(coins, forKey: "coins")
        }
    }
    
    private var riddleManager: RiddleManager
      
    init(riddleManager: RiddleManager = RiddleManager()) {
        self.riddleManager = riddleManager
        loadCategories()
        self.coins = UserDefaults.standard.integer(forKey: "coins")
    }
    
    func loadCategories() {
        self.categories = riddleManager.loadCategories()
    }
    
    func showHint() {
        if let currentRiddle = getCurrentRiddle() {
            hintMessage = currentRiddle.hint
            message = "Hint used, -100 coins"
            coins -= 100
        }
    }
    
    func restartGame() {
        coins = 0
        currentRiddleIndex = 0
        lives = 3
        message = ""
        hintMessage = ""
        correctAnswer = 0
    }
    
    func gameWon() {
        if correctAnswer == 10 {
            showAlert = true
            alertMessage = "Congratulations , you won"
        }
    }
    
    func checkAnswer(selectedAnswer: String) {
        guard let currentRiddle = getCurrentRiddle() else { return }
        
        if selectedAnswer.lowercased() == currentRiddle.correctAnswer.lowercased() {
            isCorrect = true
            hintMessage = ""
            message = "Correct!"
            correctAnswer += 1
            print(correctAnswer)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.goToNextRiddle()
                self?.message = ""
                self?.isCorrect = false
                self?.gameWon()
            }
        } else {
            isCorrect = false
            isLifeDeducting = true
            
            lives -= 1
            message = "Wrong answer, try again! Lives remaining: \(lives)"
            
            if lives == 0 {
                showAlert = true
                alertMessage = "Game Over! You've lost all lives."
                restartGame()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isLifeDeducting = false
            }
        }
    }
    
    func getCurrentRiddle() -> Riddle? {
        if currentCategoryIndex < categories.count,
           currentRiddleIndex < categories[currentCategoryIndex].riddles.count {
            return categories[currentCategoryIndex].riddles[currentRiddleIndex]
        }
        return nil
    }
    
    func goToNextRiddle() {
        if let currentRiddle = getCurrentRiddle() {
            coins += currentRiddle.reward
        }
    
        currentRiddleIndex += 1
        if currentRiddleIndex >= categories[currentCategoryIndex].riddles.count {
            currentRiddleIndex = 0
            
            if currentCategoryIndex < categories.count - 1 {
                showAlert = true
                alertMessage = "You have finished all riddles in the \(categories[currentCategoryIndex].name) category!"
            } else {
                currentCategoryIndex = 0
                alertMessage = "You've finished all categories!"
                showAlert = true
            }
        }
    }
}
