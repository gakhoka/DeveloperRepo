//
//  NoISP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

// ეს არღვევს isp პრინციპს რადგან ობიექტს(კაპიტან ამერიკას) ვავალდებულებთ მიიღოს ისეთი ქცევა/თვისება რისი შესრულებაც/ქონაც არ შეუძლია , გასასწორებლად უნდა დავყოთ ქცევები/თვისებები

protocol TonyStarkable {
    func genious()
    func billionare()
    func playboy()
    func philanthropist()
}

class CapAmerica: TonyStarkable {
    func genious() {
        print("cap is genious but what about ⬇️ ?")
    }
    
    func playboy() {
        print("only Tony")
    }
    
    func billionare() {
        print("only Tony")
    }
    
    func philanthropist() {
        print("only Tony")
    }
}


