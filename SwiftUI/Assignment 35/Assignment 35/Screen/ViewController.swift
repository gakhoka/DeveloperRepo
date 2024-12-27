//
//  ViewContoller.swift
//  Assignment 35
//
//  Created by Giorgi Gakhokidze on 27.12.24.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    private let viewModel = RiddleViewModel()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.configure(text: "Choose Category")
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var gameName: UILabel = {
        let label = UILabel()
        label.configure(text: "Emoji Riddle")
        label.font = UIFont.systemFont(ofSize: 30)

        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoryCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        placeViews()
        setupConstraints()
        navigationController?.isNavigationBarHidden = true
    }
    
    private func placeViews() {
        view.addSubview(categoryLabel)
        view.addSubview(gameName)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gameName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            gameName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: gameName.bottomAnchor, constant: 30),
            categoryLabel.centerXAnchor.constraint(equalTo: gameName.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCategory = viewModel.categories[indexPath.row]
        viewModel.currentCategoryIndex = indexPath.row
        
        let emojiRiddleView = EmojiRiddleView(viewModel: viewModel, category: selectedCategory.name)
        
        let vc = UIHostingController(rootView: emojiRiddleView)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CategoryCell  {
            let category = viewModel.categories[indexPath.row]
            cell.category = category
            return cell
        }
        return UITableViewCell()
    }
}

