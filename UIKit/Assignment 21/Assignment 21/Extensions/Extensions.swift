//
//  Extensions.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//

import Foundation
import UIKit

extension UIColor {
    static let  customPurple = UIColor(red: 24/255.0, green: 24/255.0, blue: 48/255.0, alpha: 1.0)
    static let lightPurple = UIColor(red: 142/255.0, green: 132/255.0, blue: 255/255.0, alpha: 1.0)
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
