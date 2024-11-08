//
//  QuizViewController-TableView.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//

import Foundation
import UIKit

extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource, ResetScoresDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedQuestion = viewModel.quiz[indexPath.row]
        let detailVC = QuizDetailViewController()
        detailVC.quiz = selectedQuestion
        detailVC.delegate = self
        detailVC.configureWith(selectedQuestion, index: indexPath.row)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.quizCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? QuizQuestionCell {
            cell.configureWith(index: indexPath.row)
            return cell
        }
        return UITableViewCell()
    }
    
    func resetScores() {
        let quizdetailVC = QuizDetailViewController()
        quizdetailVC.resetScores()
    }
    
}

