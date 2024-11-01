//
//  LatestNewsCell.swift
//  Assignment 19
//
//  Created by Giorgi Gakhokidze on 30.10.24.
//

import UIKit

class LatestNewsCell: UITableViewCell {
    
    private var contentImage = UIImageView()
    private var newsTitle = UILabel()
    private var authorTitle = UILabel()
    private var newsDate = UILabel()
    
    private var news: Article?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    private func setupUI() {
        cellConfig()
    }
    
    func configure(news: Article) {
        newsTitle.text = news.title
        authorTitle.text = news.author
        
        if let formated = news.publishedAt?.toFormattedDate() {
            newsDate.text = formated
        }
        if let imageUrlString = news.urlToImage,
           let imageUrl = URL(string: imageUrlString) {
            contentImage.load(url: imageUrl)
        }
    }
    
    private func cellConfig() {
        contentView.addSubview(contentImage)
        contentView.addSubview(newsTitle)
        contentView.addSubview(authorTitle)
        contentView.addSubview(newsDate)
        
        contentImage.translatesAutoresizingMaskIntoConstraints = false
        contentImage.layer.cornerRadius = 10
        contentImage.layer.masksToBounds = true

        newsTitle.translatesAutoresizingMaskIntoConstraints = false
        newsTitle.numberOfLines = 10
        newsTitle.textColor = .white
        newsTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        authorTitle.translatesAutoresizingMaskIntoConstraints = false
        authorTitle.textColor = .white
        authorTitle.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        newsDate.translatesAutoresizingMaskIntoConstraints = false
        newsDate.textColor = .white
        newsDate.font = UIFont.systemFont(ofSize: 16, weight: .medium)

        NSLayoutConstraint.activate([
            contentImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            contentImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            contentImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            contentImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            contentImage.heightAnchor.constraint(equalToConstant: 200),
            
            newsTitle.topAnchor.constraint(equalTo: contentImage.topAnchor, constant: 10),
            newsTitle.leftAnchor.constraint(equalTo: contentImage.leftAnchor, constant: 10),
            newsTitle.rightAnchor.constraint(equalTo: contentImage.rightAnchor, constant: -10),

            authorTitle.leftAnchor.constraint(equalTo: contentImage.leftAnchor, constant: 10),
            authorTitle.bottomAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: -10),
            
            newsDate.rightAnchor.constraint(equalTo: contentImage.rightAnchor, constant: -10),
            newsDate.bottomAnchor.constraint(equalTo: contentImage.bottomAnchor, constant: -10)
        ])
    }
}

