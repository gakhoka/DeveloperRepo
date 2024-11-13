//
//  SRP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

import Foundation

class CredentialValidation {
    let userAccount: UserAccount
    
    init(userAccount: UserAccount) {
        self.userAccount = userAccount
    }
    
    func validateCredentials() -> Bool {
        return !userAccount.username.isEmpty && !userAccount.password.isEmpty
    }
}

class SaveUserAccount {
    let userAccount: UserAccount
    
    init(userAccount: UserAccount) {
        self.userAccount = userAccount
    }
    
    func saveUserToDatabase() {
        print("User \(userAccount.username) saved to database.")
    }
}

class WelcomeEmail {
    let userAccount: UserAccount
    
    init(userAccount: UserAccount) {
        self.userAccount = userAccount
    }
    
    func sendWelcomeEmail() {
        print("Welcome email sent to \(userAccount.username).")
    }
}
