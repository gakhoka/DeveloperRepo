//
//  LoginVC-ViewModel.swift
//  Assignment 21
//
//  Created by Giorgi Gakhokidze on 04.11.24.
//

import Foundation

class LoginViewModel {
    
    private let usernameKey = "Username"
    private let passwordKey = "Password"
    private let service = "service"
    
    var username: String?
    var password: String?
    var confirmPassword: String?
    var isLoggedIn: Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func saveCredentials(username: String, password: String) {
        KeyChain.shared.save(Data(username.utf8), service: service, account: usernameKey)
        KeyChain.shared.save(Data(password.utf8), service: service, account: passwordKey)
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    func loadCredentials() {
        
        guard isLoggedIn else { return }
        
        if let usernameData = KeyChain.shared.read(service: service, account: usernameKey),
           let passwordData = KeyChain.shared.read(service: service, account: passwordKey) {
            username = String(data: usernameData, encoding: .utf8)
            password = String(data: passwordData, encoding: .utf8)
        }
    }

    func handleLogin(username: String, password: String, confirmPassword: String) -> Bool {
        guard password == confirmPassword else {
            print("pass dont match")
            return false
        }
        
        saveCredentials(username: username, password: password)
        print("successful")
        return true
    }
}
