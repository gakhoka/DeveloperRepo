//
//   NoSRP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

//MARK: არ შეესაბამება srp პრინციპებს რადგან ეს კლასი ითავსებს user-ის მონაცამების ვალიდაციას , ექაუნთის შენახვას და მისასალმებელი იმეილის გაგზავნას, როდესაც ამ ყველაფერს სხვადასხვა კლასები უნდა აგვარებდნენ


import UIKit

class UserAccount {
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    func validateCredentials() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }
    
    func saveUserToDatabase() {
        print("User \(username) saved to database.")
    }
    
    func sendWelcomeEmail() {
        print("Welcome email sent to \(username).")
    }
}

    
