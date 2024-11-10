//
//  Extensions.swift
//  Assignment 19
//
//  Created by Giorgi Gakhokidze on 30.10.24.
//
import UIKit
import Foundation


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

