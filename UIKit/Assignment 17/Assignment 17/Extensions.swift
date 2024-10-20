//
//  Extensions.swift
//  Assignment 17
//
//  Created by Giorgi Gakhokidze on 20.10.24.
//

import Foundation
import UIKit

extension String {
    func toDecimalString() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        
        if let number = Double(self) {
            return numberFormatter.string(from: NSNumber(value: number))
        }
        return nil
    }
}

extension Int {
    func toDecimalString() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        
        return numberFormatter.string(from: NSNumber(value: self))
    }
}

extension UIColor {
    static let hexColor = UIColor(red: 33/150, green: 13/255, blue: 4/255, alpha: 1.0)
    static let titleLabelColor = UIColor(red: 179/255.0, green: 68/255.0, blue: 22/255.0, alpha: 1.0)
}

extension UIStackView {
    func addMultipleSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
    func configureStackView(axis: NSLayoutConstraint.Axis = .horizontal, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) {
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 10
    }
}

extension UILabel {
    func simpleLabel(text: String?, textColor: UIColor = .white ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = .white
    }
}

