//
//  ViewController.swift
//  Calculator2
//
//  Created by Giorgi Gakhokidze on 12.10.24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    private var upperView = UIView()
    private var bottomView = UIView()
    private var resultLabel = UILabel()
    private var calculationLabel = UILabel()
    private var stackView = UIStackView()
    private var resultbutton = UIButton()
    private var verticalStackView1 = UIStackView()
    private var verticalStackView2 = UIStackView()
    private var verticalStackView3 = UIStackView()
    private var verticalStackView4 = UIStackView()
    private let gradient = CAGradientLayer()
    private var themeButton = UIButton()
    private var stackViewTopConstraint: NSLayoutConstraint!
    private var stackViewBottomConstraint: NSLayoutConstraint!
    private var stackViewLeftConstraint: NSLayoutConstraint!
    private var stackViewRightConstraint: NSLayoutConstraint!
    private var nestedStack1 = UIStackView()
    private var largeDeviceSpacing = false
    private var isColorThemButtonTapped = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        resultLabelConfiguration()
        upperViewConfiguration()
        bottomViewConfiguration()
        calculationLabelConfig()
        mainStack()
        applyGradient()
        changeTheme()
    }
    
    private func upperViewConfiguration() {
        view.addSubview(upperView)
        upperView.addSubview(resultLabel)
        upperView.addSubview(calculationLabel)
        upperView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            upperView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            upperView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            upperView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            upperView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -20),
            resultLabel.bottomAnchor.constraint(equalTo: upperView.bottomAnchor, constant: -20)
        ])
    }
    
    private func bottomViewConfiguration() {
        view.addSubview(bottomView)
        bottomView.addSubview(stackView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = .systemGray6
        bottomView.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: upperView.bottomAnchor),
            bottomView.heightAnchor.constraint(equalTo: upperView.heightAnchor, multiplier: 2.5)
        ])
    }
    
    private func resultLabelConfiguration() {
        resultLabel.configureLabel(title: "2048", fontSize: UIFont.systemFont(ofSize: 30))
    }
    
    private func calculationLabelConfig() {
        calculationLabel.configureLabel(title: "120 x 3 + 608 + 1080", fontSize: UIFont.systemFont(ofSize: 24))
        
        NSLayoutConstraint.activate([
            calculationLabel.trailingAnchor.constraint(equalTo: upperView.trailingAnchor, constant: -20),
            calculationLabel.bottomAnchor.constraint(equalTo: resultLabel.topAnchor, constant: -20),
            calculationLabel.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            calculationLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor)
        ])
    }
    
    private func mainStack() {
        stackView.configureStackView(axis: .horizontal, distribution: .fillEqually, spacing: 14)
        
        stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30)
        stackViewBottomConstraint = stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        stackViewLeftConstraint = stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 35)
        stackViewRightConstraint = stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -35)
        
        NSLayoutConstraint.activate([
            stackViewLeftConstraint,
            stackViewTopConstraint,
            stackViewRightConstraint,
            stackViewBottomConstraint
        ])
        
        stackView.addArrangedSubviews(verticalStackView1, verticalStackView2, verticalStackView3, verticalStackView4)
        
        stackViewOne()
        stackViewTwo()
        stackViewThree()
        stackViewFour()
        
        updateConstraintsForOrientationAndSize()
    }
    
    private func updateConstraintsForOrientationAndSize() {
        let screenHeight = UIScreen.main.bounds.height
        
        if traitCollection.verticalSizeClass == .compact {
            stackViewTopConstraint.constant = 5
            stackViewBottomConstraint.constant = -5
            stackViewLeftConstraint.constant = 20
            stackViewRightConstraint.constant = -20
        } else {
            
            if screenHeight <= 667 {
                stackViewTopConstraint.constant = 30
                stackViewBottomConstraint.constant = -30
                stackViewLeftConstraint.constant = 25
                stackViewRightConstraint.constant = -25
            } else {
                stackViewTopConstraint.constant = 35
                stackViewBottomConstraint.constant = -35
                stackViewLeftConstraint.constant = 35
                stackViewRightConstraint.constant = -35
                largeDeviceSpacing = true
            }
        }
        
        adjustStackViewSpacingByDeviceSize()
        view.layoutIfNeeded()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.verticalSizeClass != previousTraitCollection?.verticalSizeClass ||
            traitCollection.horizontalSizeClass != previousTraitCollection?.horizontalSizeClass {
            updateConstraintsForOrientationAndSize()
        }
    }
    
    private func createButton(title: String? = nil, image: UIImage? = nil, backgroundColor: UIColor = .clear, fontSize: UIFont? = nil) -> UIButton {
        
        let button = UIButton()
        button.layer.cornerRadius = 35
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.backgroundColor = backgroundColor
        button.setTitle(title, for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }
    
    @objc func themeButtonTapped() {
        isColorThemButtonTapped.toggle()
        themeButton.setImage(UIImage(systemName: isColorThemButtonTapped ? "sun.min" : "moon"), for: .normal)
        view.overrideUserInterfaceStyle = isColorThemButtonTapped ? .dark : .light
    }
    
    private func changeTheme() {
        themeButton.setImage(UIImage(systemName: isColorThemButtonTapped ? "sun.min" : "moon"), for: .normal)
        themeButton.tintColor = .systemPink
        themeButton.layer.borderWidth = 1.0
        themeButton.layer.cornerRadius = 35
        themeButton.layer.borderColor = UIColor.systemGray4.cgColor
        themeButton.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
    }
    
    private func stackViewOne() {
        verticalStackView1.configureStackView()
        
        let AcButton = createButton(title: "AC")
        AcButton.setTitleColor(.systemPink, for: .normal)
        
        verticalStackView1.addArrangedSubviews(themeButton, createButton(title: "7"), createButton(title: "4"),createButton(title: "1"), AcButton)
    }
    
    private func stackViewTwo() {
        verticalStackView2.configureStackView()
        
        verticalStackView2.addArrangedSubviews(createButton(title: "%", backgroundColor: .systemGray5), createButton(title: "8"), createButton(title: "5"),createButton(title: "2"), createButton(title: "0"))
        
    }
    
    private func stackViewThree() {
        verticalStackView3.configureStackView()
        
        verticalStackView3.addArrangedSubviews(createButton(title: "÷", backgroundColor: .systemGray5) , createButton(title: "9"), createButton(title: "6"),createButton(title: "3"), createButton(title: "."))
    }
    
    private func stackViewFour() {
        verticalStackView4.configureStackView(distribution: .fillProportionally)
        
        nestedStack1.configureStackView()
        
        let nestedStack2 = UIStackView()
        nestedStack2.axis = .vertical
        nestedStack2.distribution = .fill
        
        resultbutton.backgroundColor = .systemPink
        resultbutton.setTitle("=", for: .normal)
        resultbutton.layer.cornerRadius = 30
        nestedStack2.addArrangedSubview(resultbutton)
        
        nestedStack1.addArrangedSubviews(createButton(title: "×", backgroundColor: .systemGray5), createButton(title: "-", backgroundColor: .systemGray5), createButton(title: "+", backgroundColor: .systemGray5))
        
        verticalStackView4.addArrangedSubviews(nestedStack1, nestedStack2)
        
        NSLayoutConstraint.activate([
            resultbutton.heightAnchor.constraint(equalTo: nestedStack2.heightAnchor),
            nestedStack2.heightAnchor.constraint(equalTo: nestedStack1.heightAnchor, multiplier: 3/5)
        ])
    }
    
    private func adjustStackViewSpacingByDeviceSize() {
        verticalStackView1.spacing = largeDeviceSpacing ? 28 : 10
        verticalStackView2.spacing = largeDeviceSpacing ? 28 : 10
        verticalStackView3.spacing = largeDeviceSpacing ? 28 : 10
        verticalStackView4.spacing = largeDeviceSpacing ? 28 : 10
        nestedStack1.spacing = largeDeviceSpacing ? 28 : 10
    }
    
    private func applyGradient() {
        let colorOne = UIColor(red: 237/255, green: 14/255, blue: 152/255, alpha: 1.0)
        let colorTwo = UIColor(red: 254/255, green: 90/255, blue: 46/255, alpha: 1.0)
        
        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.cornerRadius = 30
        resultbutton.layer.insertSublayer(gradient, at: 0)
        resultbutton.layer.cornerRadius = 30
        updateGradientFrame()
    }
    
    private func updateGradientFrame() {
        gradient.frame = resultbutton.bounds
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.updateGradientFrame()
        }, completion: nil)
    }
}






















struct viewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = ViewController
    
    
    func makeUIViewController(context: Context) -> ViewController {
        ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        
    }
}

struct viewController_Previews: PreviewProvider {
    static var previews: some View {
        viewControllerRepresentable()
    }
}

