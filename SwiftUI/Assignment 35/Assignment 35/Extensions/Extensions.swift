//
//  Extensions.swift
//  Assignment 35
//
//  Created by Giorgi Gakhokidze on 27.12.24.
//

import Foundation
import UIKit

extension UILabel {
    func configure(text: String, textColor: UIColor = .label ) {
        self.text = text
        self.textColor = textColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
