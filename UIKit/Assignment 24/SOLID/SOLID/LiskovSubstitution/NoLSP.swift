//
//  NoLSP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

// ეს კოდი არღვევს lsp პრინციპს რადგან child კლასს არ შეუძლია შეასრულოს ის რასაც მისი მშობელი კლასი ასრულებს

class Person {
    func goToWork() {
        
    }
}

class Adult: Person {
    override func goToWork() {
        print("i can go to work")
    }
}


class Child: Person {
    override func goToWork() {
        print("cant go to work")
    }
}

class VehicleManager {
    func goToWork(person: Person) {
        person.goToWork()
        //error
    }
}
