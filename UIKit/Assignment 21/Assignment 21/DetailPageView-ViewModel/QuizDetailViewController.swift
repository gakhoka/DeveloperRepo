//
//  QuizDetailViewController.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//

import UIKit
import SwiftUI

protocol ResetScoresDelegate: AnyObject {
    func resetScores()
}

class QuizDetailViewController: UIViewController {
    
    private let viewModel = QuizDetailViewModel()
    var quiz: QuizQuestion?
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let rightBarButton = UIButton()
    private let leftBarButton = UIButton()
    private let questionLabel = UILabel()
    private let stackView = UIStackView()
    private let answersView = UIView()
    private let correctAnswerLabel = UILabel()
    private let wrongAnswerLabel = UILabel()
    private var isButtonTapped = false
    private var checkMarkButton = UIButton()
    private var congratsLabel = UILabel()
    private var allButtons: [UIButton] = []
    weak var delegate: ResetScoresDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customPurple
        setupUI()
        viewModel.loadScores()
    }
    
    private func setupUI() {
        rightBarButtonItemConfig()
        leftBarButtonConfig()
        questionLabelConfig()
        configureStackView()
        answersViewConfig()
        setupViewModel()
        updateScoreLabels()
        configureScrollView()
    }
    
    func configureWith(_ quiz: QuizQuestion, index: Int? = nil) {
        questionLabel.text = quiz.question
        rightBarButton.setTitle("Question \((index ?? 0) + 1)", for: .normal)
        
        var allAnswers = quiz.incorrectAnswers
        allAnswers.append(quiz.correctAnswer)
        
        allAnswers.shuffle()
        
        for question in allAnswers {
            let button = possibleAnswersButtons(title: question)
            stackView.addArrangedSubviews(button)
            allButtons.append(button)
        }
    }
    
    private func possibleAnswersButtons(title: String) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.isEnabled = true
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.tintColor = .black
        button.tintColor = .black
        button.setTitle(title, for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addAction(UIAction(handler: { [weak self] action in
            self?.buttonTapped(button: button)
        }), for: .touchUpInside)
        
        button.contentHorizontalAlignment = .leading
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }
    
    private func buttonTapped(button: UIButton) {
        isButtonTapped.toggle()
        button.backgroundColor = isButtonTapped ? .lightPurple : .white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            button.backgroundColor = .white
            self?.isButtonTapped = false
        }
        
        guard let correctAnswer = quiz?.correctAnswer,
              let answer = button.titleLabel?.text else { return }
        
        viewModel.buttonTapped(withAnswer: answer, correctAnswer: correctAnswer)
        
        if answer == correctAnswer {
            button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        } else {
            button.setImage(UIImage(systemName: "circle"), for: .normal)
        }
        
        if correctAnswer == answer {
            allButtons.forEach { $0.isEnabled = false }
        }
    }
    
    private func setupViewModel() {
        viewModel.correctScoreChanged = { [weak self] in
            self?.updateScoreLabels()
        }
        viewModel.incorrectScoreChanged = { [weak self] in
            self?.updateScoreLabels()
        }
    }
    
    func resetScores() {
        viewModel.resetScores()
    }
    
    private func updateScoreLabels() {
        correctAnswerLabel.text = viewModel.correctAnswersText
        wrongAnswerLabel.text = viewModel.incorrectAnswersText
    }
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        ])
    }
    
    private func questionLabelConfig() {
        contentView.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.textColor = .white
        questionLabel.numberOfLines = 10
        questionLabel.font = UIFont.systemFont(ofSize: 26)
        
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            questionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func configureStackView() {
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 40),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func answersViewConfig() {
        contentView.addSubview(answersView)
        answersView.translatesAutoresizingMaskIntoConstraints = false
        answersView.layer.cornerRadius = 15
        answersView.backgroundColor = .lightPurple
        
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        wrongAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(correctAnswerLabel)
        contentView.addSubview(wrongAnswerLabel)
        correctAnswerLabel.textColor = .white
        wrongAnswerLabel.textColor = .white
        correctAnswerLabel.font = UIFont.systemFont(ofSize: 20)
        wrongAnswerLabel.font = UIFont.systemFont(ofSize: 20)
        
        correctAnswerLabel.text = "Correct answers 0 /"
        wrongAnswerLabel.text = "Incorrect 0"
        
        NSLayoutConstraint.activate([
            answersView.topAnchor.constraint(greaterThanOrEqualTo: stackView.bottomAnchor, constant: 100),
            answersView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            answersView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            answersView.heightAnchor.constraint(equalToConstant: 50),
            answersView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -200),
            
            correctAnswerLabel.leftAnchor.constraint(equalTo: answersView.leftAnchor, constant: 20),
            correctAnswerLabel.centerYAnchor.constraint(equalTo: answersView.centerYAnchor),
            
            wrongAnswerLabel.leftAnchor.constraint(equalTo: correctAnswerLabel.rightAnchor, constant: 20),
            wrongAnswerLabel.centerYAnchor.constraint(equalTo: answersView.centerYAnchor)
        ])
    }
    
    private func leftBarButtonConfig() {
        view.addSubview(leftBarButton)
        leftBarButton.translatesAutoresizingMaskIntoConstraints = false
        leftBarButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        leftBarButton.tintColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
        leftBarButton.addAction(UIAction(handler: { [weak self] action in
            self?.backButtonTapped()
        }), for: .touchUpInside)
    }
    
    private func rightBarButtonItemConfig() {
        view.addSubview(rightBarButton)
        rightBarButton.translatesAutoresizingMaskIntoConstraints = false
        
        rightBarButton.layer.borderWidth = 1
        rightBarButton.backgroundColor = .lightPurple
        rightBarButton.layer.borderColor = CGColor(gray: 1, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
        rightBarButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightBarButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rightBarButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rightBarButton.layer.cornerRadius = 20
        rightBarButton.layer.masksToBounds = true
    }
    
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}

struct viewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = QuizDetailViewController
    
    
    func makeUIViewController(context: Context) -> QuizDetailViewController {
        QuizDetailViewController()
    }
    
    func updateUIViewController(_ uiViewController: QuizDetailViewController, context: Context) {
        
    }
}

struct viewController_Previews: PreviewProvider {
    static var previews: some View {
        viewControllerRepresentable()
    }
}
