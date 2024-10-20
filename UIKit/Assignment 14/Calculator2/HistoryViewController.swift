//
//  HistoryViewController.swift
//  Calculator2
//
//  Created by Giorgi Gakhokidze on 16.10.24.
//

import UIKit

class HistoryViewController: UIViewController {

    
    private var stackView = UIStackView()
    private var customBackButton = UIButton()
    
    var history = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        customBackButtonConfig()
        historyStackViewConfig()
    }
    
    private func historyStackViewConfig() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        loadHistory()
    }

    private func loadHistory() {
        for oneResult in history.reversed() {
            let label = UILabel()
            label.text = oneResult
            label.font = UIFont.systemFont(ofSize: 24)
            stackView.addArrangedSubview(label)
            stackView.insertArrangedSubview(label, at: 0)
        }
    }

    private func customBackButtonConfig() {
        let backButtonItem = UIBarButtonItem(customView: customBackButton)
        self.navigationItem.leftBarButtonItem = backButtonItem
        
        customBackButton.setImage(UIImage(systemName: "arrow.left.circle"), for: .normal)
        customBackButton.tintColor = .label
        customBackButton.addAction(UIAction(handler: { [weak self] action in
            self?.buttonTapped()
        }), for: .touchUpInside)
    }
    
    private func buttonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
