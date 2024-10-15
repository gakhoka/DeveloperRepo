//
//  Extensions.swift
//  Calculator2
//
//  Created by Giorgi Gakhokidze on 14.10.24.
//

import Foundation
import UIKit


extension UIStackView {
    func configureStackView(axis: NSLayoutConstraint.Axis = .vertical, distribution: UIStackView.Distribution = .fillEqually, spacing: CGFloat = 0) {
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}

extension UILabel {
    func configureLabel(title: String, fontSize: UIFont = UIFont.systemFont(ofSize: 30), tamic: Bool = false) {
        self.text = title
        self.font = fontSize
        self.translatesAutoresizingMaskIntoConstraints = tamic
    }
}
