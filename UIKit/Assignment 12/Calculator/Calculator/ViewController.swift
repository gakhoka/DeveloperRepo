//
//  ViewController.swift
//  Calculator
//
//  Created by Giorgi Gakhokidze on 08.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    private var isColorThemButtonTapped = true
    
    @IBOutlet private weak var numbersView: UIView!
    @IBOutlet private weak var remainderButton: UIButton!
    @IBOutlet private weak var colorThemeButton: UIButton!
    @IBOutlet private weak var resultButton: UIButton!
    
    @IBAction private func changeColor(_ sender: UIButton) {
        changeTheme()
        isColorThemButtonTapped.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        numbersView.layer.cornerRadius = 30
    }
    
    private func changeTheme() {
        colorThemeButton.setImage(UIImage(systemName: isColorThemButtonTapped ? "sun.min" : "moon"), for: .normal)
        view.overrideUserInterfaceStyle = isColorThemButtonTapped ? .dark : .light
    }
}

