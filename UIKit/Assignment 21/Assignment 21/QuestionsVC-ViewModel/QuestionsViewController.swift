//
//  ViewController.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//

import UIKit
import SwiftUI

class QuestionsViewController: UIViewController {
    
    private let tableView = UITableView()
    let viewModel = QuizViewModel()
    private let leftBarButton = UIButton()
    private let rightBarButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .customPurple
    }
    
    private func setupUI() {
        tableViewConfig()
        leftBarButtonItemConfig()
        rightBarButtonItemConfig()
    }
    
    private func tableViewConfig() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .customPurple
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(QuizQuestionCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    private func leftBarButtonItemConfig() {
        view.addSubview(leftBarButton)
        leftBarButton.translatesAutoresizingMaskIntoConstraints = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarButton)
        leftBarButton.setTitle("Quizes", for: .normal)
        leftBarButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
    }
    
    private func rightBarButtonItemConfig() {
        view.addSubview(rightBarButton)
        rightBarButton.translatesAutoresizingMaskIntoConstraints = false
        rightBarButton.setTitle("Reset", for: .normal)
        rightBarButton.layer.borderWidth = 1
        rightBarButton.backgroundColor = .lightPurple
        rightBarButton.layer.borderColor = CGColor(gray: 1, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBarButton)
        rightBarButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        rightBarButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        rightBarButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rightBarButton.layer.cornerRadius = 20
        rightBarButton.layer.masksToBounds = true
        rightBarButton.addAction(UIAction(handler: { [weak self] action in
            self?.resetScores()
        }), for: .touchUpInside)
    }
}

