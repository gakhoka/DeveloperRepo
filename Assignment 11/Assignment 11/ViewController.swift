//
//  ViewController.swift
//  Assignment 11
//
//  Created by Giorgi Gakhokidze on 05.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    var remainderCalculation = true
    var isThemeButtonPressed = false
    
    @IBOutlet weak var numberToDivide: UITextField?
    @IBOutlet weak var dividerNumber: UITextField?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var themeButton: UIButton!
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        calculate()
    }
    
    @IBAction func changeThemeButton(_ sender: UIButton) {
        changeTheme()
    }
    
    @IBAction func switcher(_ sender: UISwitch) {
        remainderCalculation = sender.isOn ? true : false
        titleLabel?.text = sender.isOn ? "ნაშთიანი გაყოფა" : "უნაშთო გაყოფა"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        showTitleLabel()
    }
    
    func showTitleLabel() {
        titleLabel?.text = "ნაშთიანი გაყოფა"
    }
    
    func changeTheme() {
        isThemeButtonPressed.toggle()
        view.overrideUserInterfaceStyle = isThemeButtonPressed ? .dark : .light
        themeButton.setTitle(isThemeButtonPressed ? "Light" : "Dark", for: .normal)
    }
    
    func calculate() {
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

