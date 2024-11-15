//
//  LSP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

//shark  და eagle კლასები არიან animal ის შვილობილი კლასები და იღებენ იმ თვისებებს რომლებიც  animal-ს გააჩნია და შეუძლიათ დააიმპლემენტირონ ის. დამატებითი თვისებებისთვის კი პროტოკოლებს აკონფორმებენ

protocol Flyable {
    func fly()
}

protocol Swimable {
    func swim()
}

class Animal {
    func eat() {
        print("every animal eats")
    }

    func sleep() {
        print("every animal sleeps")
    }
}

class Shark: Animal, Swimable {
    func swim() {
        print("I can swim")
    }
}

class Eagle: Animal, Flyable {
    func fly() {
        print("I can fly")
    }
}

class AnimalSleeper {
    func makeAnimalSleep(animal: Animal) {
        animal.sleep()
    }
}

func perform() {
    let shark = Shark()
    let eagle = Eagle()
    
    let animalSleeper = AnimalSleeper()

    animalSleeper.makeAnimalSleep(animal: shark)
    animalSleeper.makeAnimalSleep(animal: eagle)
}


