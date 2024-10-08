//
//  ViewController.swift
//  Assignment 11
//
//  Created by Giorgi Gakhokidze on 05.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    private var remainderCalculation = true
    private var isThemeButtonPressed = false
    
    @IBOutlet private weak var numberToDivide: UITextField?
    @IBOutlet private weak var dividerNumber: UITextField?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var themeButton: UIButton!
    
    
    @IBAction private func calculateButton(_ sender: UIButton) {
        calculate()
    }
    
    @IBAction private func changeThemeButton(_ sender: UIButton) {
        changeTheme()
    }
    
    @IBAction private func switcher(_ sender: UISwitch) {
        remainderCalculation = sender.isOn ? true : false
        titleLabel?.text = sender.isOn ? "ნაშთიანი გაყოფა" : "უნაშთო გაყოფა"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        showTitleLabel()
    }
    
    private func showTitleLabel() {
        titleLabel?.text = "ნაშთიანი გაყოფა"
    }
    
    private func changeTheme() {
        isThemeButtonPressed.toggle()
        view.overrideUserInterfaceStyle = isThemeButtonPressed ? .dark : .light
        themeButton.setTitle(isThemeButtonPressed ? "Light" : "Dark", for: .normal)
    }
    
    private func calculate() {
        if let number1 = numberToDivide?.text , let number2 = dividerNumber?.text {
            let firstNumber = Int(number1) ?? 0
            let secondNumber = Int(number2) ?? 0
            
            if secondNumber == 0 {
                resultLabel.text = "ნულზე გაყოფა არ შეიძლება"
                return
            }
            
            if remainderCalculation {
                let calculateWithoutRemainder = Double(firstNumber % secondNumber)
                resultLabel.text = "პასუხი:\(calculateWithoutRemainder)"
            } else {
                let calculateWithRemainder = Double(firstNumber / secondNumber)
                resultLabel.text = "პასუხი:\(calculateWithRemainder)"
            }
        }
    }
}

