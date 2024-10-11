//
//  ViewController.swift
//  Calculator
//
//  Created by Giorgi Gakhokidze on 08.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    private var isColorThemButtonTapped = true
    private let gradient = CAGradientLayer()
    
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
        applyGradient()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateGradientFrame()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateGradientFrame()
    }
    
    private func setupUI() {
        numbersView.layer.cornerRadius = 30
    }
    
    private func changeTheme() {
        colorThemeButton.setImage(UIImage(systemName: isColorThemButtonTapped ? "sun.min" : "moon"), for: .normal)
        view.overrideUserInterfaceStyle = isColorThemButtonTapped ? .dark : .light
    }
    
    private func applyGradient() {
        let colorOne = UIColor(red: 237/255, green: 14/255, blue: 152/255, alpha: 1.0)
        let colorTwo = UIColor(red: 254/255, green: 90/255, blue: 46/255, alpha: 1.0)
        
        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.cornerRadius = 30
        resultButton.layer.insertSublayer(gradient, at: 0)
        resultButton.layer.cornerRadius = 30
        updateGradientFrame()
    }
    
    private func updateGradientFrame() {
        gradient.frame = resultButton.bounds
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.updateGradientFrame()
        }, completion: nil)
    }
}

