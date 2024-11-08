//
//  Extensions.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//

import Foundation
import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
