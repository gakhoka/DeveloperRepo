//
//  ViewController.swift
//  Assignment 19
//
//  Created by Giorgi Gakhokidze on 30.10.24.
//

import UIKit
import NetworkService

class NewsViewController: UIViewController {
    
    private let tableView = UITableView()
    private let homePageTitle = UILabel()
    let viewModel = LatestNewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tableView.reloadData()
    }
    
    private func setupUI() {
        tableViewConfig()
        reloadTableView()
        homePageLabelConfig()
    }
    
    private func tableViewConfig() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        tableView.register(LatestNewsCell.self, forCellReuseIdentifier: "LatestNewsCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func reloadTableView() {
        viewModel.newsChanged = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func homePageLabelConfig() {
        view.addSubview(homePageTitle)
        
        homePageTitle.translatesAutoresizingMaskIntoConstraints = false
        homePageTitle.text = "Latest news"
        homePageTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: homePageTitle)
    }
}

