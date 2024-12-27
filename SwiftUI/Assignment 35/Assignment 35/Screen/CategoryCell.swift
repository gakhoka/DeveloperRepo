//
//  CategoryCell.swift
//  Assignment 35
//
//  Created by Giorgi Gakhokidze on 27.12.24.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    var category: RiddleCategory? {
        didSet {
            categoryLabel.text = category?.name
        }
    }
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(categoryLabel)
        categoryLabel.layer.cornerRadius = 10
        categoryLabel.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            categoryLabel.heightAnchor.constraint(equalToConstant: 60),
            categoryLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8)
        ])
    }
}
