//
//  NewsDetailViewController.swift
//  Assignment 19
//
//  Created by Giorgi Gakhokidze on 30.10.24.
//

import Foundation
import UIKit

class NewsDetailViewController: UIViewController {
    
    private var news: Article?
    
    private var titleLabel = UILabel()
    private var newsImage = UIImageView()
    private var newsAuthor = UILabel()
    private var newsDescription = UILabel()
    private var newsDate = UILabel()
    private var pageTitle = UILabel()
    private var backButton = UIButton()
    

    override func viewDidLoad() {
        setupUI()
        view.backgroundColor = .white
    }
    
    private func setupUI() {
        config()
        pageTitleConfig()
        navigationButtonConfig()
    }
    
    func configureWith(_ news: Article) {
        titleLabel.text = news.title
        newsDescription.text = news.description
        newsAuthor.text = "Published by      \(news.author ?? "")"
    
        if let formatted = news.publishedAt?.toFormattedDate() {
            newsDate.text = formatted
        }
        
        if let imageUrlString = news.urlToImage,
           let imageUrl = URL(string: imageUrlString) {
            newsImage.load(url: imageUrl)
        }
    }
    
    private func pageTitleConfig() {
        view.addSubview(pageTitle)
        pageTitle.translatesAutoresizingMaskIntoConstraints = false
        pageTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        pageTitle.text = "Hot updates"
       
        NSLayoutConstraint.activate([
            pageTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        self.navigationItem.titleView = pageTitle
    }
    
    private func navigationButtonConfig() {
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        backButton.addAction(UIAction(handler: {  [weak self] action in
            self?.goBackToNewsList()
        }), for: .touchUpInside)
    }
    
    private func goBackToNewsList() {
        navigationController?.popViewController(animated: true)
    }
    
    private func config() {
        view.addSubview(titleLabel)
        view.addSubview(newsDate)
        view.addSubview(newsImage)
        view.addSubview(newsAuthor)
        view.addSubview(newsDescription)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsDate.translatesAutoresizingMaskIntoConstraints = false
        newsAuthor.translatesAutoresizingMaskIntoConstraints = false
        newsDescription.translatesAutoresizingMaskIntoConstraints = false
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.numberOfLines = 5
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        newsDate.font = UIFont.systemFont(ofSize: 14, weight: .light)
        newsDescription.numberOfLines = 20
        newsImage.layer.cornerRadius = 10
        newsImage.layer.masksToBounds = true
        newsAuthor.font = UIFont.systemFont(ofSize: 16, weight: .medium)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            newsDate.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            newsDate.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            
            newsImage.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            newsImage.topAnchor.constraint(equalTo: newsDate.bottomAnchor, constant: 20),
            newsImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            newsImage.heightAnchor.constraint(equalToConstant: 200),
            
            newsDescription.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 20),
            newsDescription.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            newsDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            newsAuthor.topAnchor.constraint(equalTo: newsDescription.bottomAnchor, constant: 20),
            newsAuthor.leftAnchor.constraint(equalTo: titleLabel.leftAnchor)
        ])
    }
}

