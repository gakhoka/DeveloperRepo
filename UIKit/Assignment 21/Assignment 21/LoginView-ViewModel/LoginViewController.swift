//
//  LoginViewController.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 02.11.24.
//
import SwiftUI
import UIKit

class LoginViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let ImageContentView = UIView()
    private let loginButton = UIButton()
    private let usernameLabel = UILabel()
    private let passwordLabel = UILabel()
    private let confirmPasswordLbl = UILabel()
    private let passwordTextField = UITextField()
    private let usernameTextField = UITextField()
    private let confirmPassTextField = UITextField()
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .customPurple
    }
    
    private func setupUI() {
        viewConfiguration()
        loginButtonConfig()
        loginCredentialsSetup()
    }
    
    private func LoginButtonTapped() {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPassTextField.text else { return }
        
        if viewModel.handleLogin(username: username, password: password, confirmPassword: confirmPassword) {
            let vc = QuestionsViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func loginCredentialsSetup() {
        view.addSubview(usernameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(confirmPasswordLbl)
        
        view.addSubview(passwordTextField)
        view.addSubview(confirmPassTextField)
        view.addSubview(usernameTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPassTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordLbl.translatesAutoresizingMaskIntoConstraints = false
        
        usernameLabel.text = "Username"
        passwordLabel.text = "Password"
        confirmPasswordLbl.text = "Confirm password"
        
        usernameLabel.font = UIFont.systemFont(ofSize: 20)
        passwordLabel.font = UIFont.systemFont(ofSize: 20)
        confirmPasswordLbl.font = UIFont.systemFont(ofSize: 20)
        
        usernameLabel.textColor = .white
        passwordLabel.textColor = .white
        confirmPasswordLbl.textColor = .white
        
        usernameTextField.leftViewMode = .always
        passwordTextField.leftViewMode = .always
        confirmPassTextField.leftViewMode = .always
        
        confirmPassTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0))
        usernameTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0))
        passwordTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:0))
        
        usernameTextField.placeholder = "Enter username"
        usernameTextField.backgroundColor = .white
        usernameTextField.layer.cornerRadius = 20
        usernameLabel.textAlignment = .center
        
        passwordTextField.placeholder = "Enter password"
        passwordTextField.backgroundColor = .white
        passwordTextField.layer.cornerRadius = 20
        
        confirmPassTextField.placeholder = "Confirm password"
        confirmPassTextField.backgroundColor = .white
        confirmPassTextField.layer.cornerRadius = 20
        
        
        NSLayoutConstraint.activate([
            usernameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            usernameLabel.topAnchor.constraint(equalTo: ImageContentView.bottomAnchor, constant: 50),
            
            usernameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            usernameTextField.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            usernameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.leftAnchor.constraint(equalTo: usernameLabel.leftAnchor),
            passwordLabel.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            
            passwordTextField.leftAnchor.constraint(equalTo: usernameTextField.leftAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            passwordTextField.rightAnchor.constraint(equalTo: usernameTextField.rightAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPasswordLbl.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordLbl.leftAnchor.constraint(equalTo: usernameLabel.leftAnchor),
            
            confirmPassTextField.leftAnchor.constraint(equalTo: usernameTextField.leftAnchor),
            confirmPassTextField.topAnchor.constraint(equalTo: confirmPasswordLbl.bottomAnchor, constant: 20),
            confirmPassTextField.rightAnchor.constraint(equalTo: usernameTextField.rightAnchor),
            confirmPassTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor)
        ])
    }
    
    private func loginButtonConfig() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .lightPurple
        loginButton.layer.cornerRadius = 10
        loginButton.addAction(UIAction(handler: { [weak self] action in
            self?.LoginButtonTapped()
        }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }
    
    private func viewConfiguration() {
        view.addSubview(ImageContentView)
        view.addSubview(imageView)
        ImageContentView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.crop.circle.badge.plus")
        imageView.tintColor = .black
        
        ImageContentView.layer.cornerRadius = 75
        ImageContentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            ImageContentView.widthAnchor.constraint(equalToConstant: 150),
            ImageContentView.heightAnchor.constraint(equalToConstant: 150),
            ImageContentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            ImageContentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: ImageContentView.topAnchor, constant: 30),
            imageView.leftAnchor.constraint(equalTo: ImageContentView.leftAnchor, constant: 20),
            imageView.rightAnchor.constraint(equalTo: ImageContentView.rightAnchor, constant: -30),
            imageView.bottomAnchor.constraint(equalTo: ImageContentView.bottomAnchor, constant: -30),
        ])
    }
}

