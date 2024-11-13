//
//  NoOcp.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

// ეს კოდი არღვევს ocp პრინციპს, რადგან ყოველი ახალი payment type ის დამატების დროს გვიწევს კოდის დამატება კლასში (კლასის შეცვლა) 

class PaymentProcessor {
    func processPayment(paymentType: String, amount: Double) {
        if paymentType == "CreditCard" {
            print("Processing credit card payment of $\(amount)")
        } else if paymentType == "PayPal" {
            print("Processing PayPal payment of $\(amount)")
        } else {
            print("Unknown payment type")
        }
    }
}
