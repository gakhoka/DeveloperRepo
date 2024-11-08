//
//  QuizQuestionCell.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//

import UIKit

class QuizQuestionCell: UITableViewCell {
    
    private let questionLabel = UILabel()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        contentView.backgroundColor = .customPurple
    }
    
    private func setupUI() {
        cellConfig()
    }
    
    func configureWith(index: Int) {
            questionLabel.text = "Question \(index + 1)"
        }
    
    private func cellConfig() {
        contentView.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.font = UIFont.systemFont(ofSize: 20)
        questionLabel.textAlignment = .center
        questionLabel.backgroundColor = .white
        questionLabel.textColor = .customPurple
        questionLabel.layer.cornerRadius = 20
        questionLabel.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            questionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            questionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            questionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            questionLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
