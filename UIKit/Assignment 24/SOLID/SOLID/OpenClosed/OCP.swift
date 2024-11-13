//
//  OCP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

import UIKit

//ნებისმიერი ახალი გადახდის მეთოდის დამატების დროს სააჭიროა მხოლოდ პროტოკოლის დაკონფორმება და paymentprocessorManager იქნება უფრო თავისუფალი , მოქნილი და არ მოგვიწევს კოდის დამატება შიგნით

protocol Payable {
    func processpayment(with paymentType: String, amount: Double)
}

class ProcesWithCard: Payable {
    func processpayment(with paymentType : String, amount: Double) {
        print("Spent \(amount) with \(paymentType)")
    }
}

class ProcesWithBitcoin: Payable {
    func processpayment(with paymentType: String, amount: Double) {
        print("Spent \(amount) with \(paymentType)")
    }
}

class ProcesWithPaypal: Payable {
    func processpayment(with paymentType: String, amount: Double) {
        print("Spent \(amount) with \(paymentType)")
    }
}

class PaymentProcessorManager {
    func processPayment(with paymentType: Payable) {
        paymentType.processpayment(with: "card", amount: 10)
    }
}
