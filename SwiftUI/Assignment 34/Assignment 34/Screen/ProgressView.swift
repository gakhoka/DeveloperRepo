//
//  ProgressView.swift
//  Assignment 34
//
//  Created by Giorgi Gakhokidze on 25.12.24.
//

import Foundation
import UIKit
import SwiftUI

struct ProgressView: UIViewRepresentable {
    typealias UIViewType = UIProgressView
    
    var progress: Float
    
    func makeUIView(context: Context) -> UIProgressView {
        let progressBar = UIProgressView(progressViewStyle: .default)
        progressBar.progressTintColor = .white
        progressBar.trackTintColor = .lightGray
        progressBar.progress = progress
        return progressBar
    }
    
    func updateUIView(_ uiView: UIProgressView, context: Context) {
        uiView.progress = progress
    }
}
