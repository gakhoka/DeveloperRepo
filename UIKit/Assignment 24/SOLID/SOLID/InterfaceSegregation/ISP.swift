//
//  ISP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

// ყველა გმირს მივანიჭეთ ის თვისება რომლის შესრულებაც შეუძია . პ.ს პროტოკოლის სახელებში მაპატიეთ

protocol FlyableSuperHero {
    func fly()
}

protocol ThunderShootable {
    func shootThunder()
}

protocol Suitable {
    func wearSuit()
}

protocol LeaderShipable {
    func leadTeam()
}

class CaptainAmerica: Suitable, LeaderShipable {
    func wearSuit() {
        print("my fav suit")
    }
    
    func leadTeam() {
        print("leader")
    }
}

class Thor: Suitable, ThunderShootable, FlyableSuperHero{
    func wearSuit() {
        print("nice cloak")
    }
    
    func shootThunder() {
        print("god of thunder")
    }
    
    func fly() {
        print("can fly")
    }
}

class Loki: FlyableSuperHero, Suitable {
    func wearSuit() {
        print("nice green suit")
    }
    
    func fly() {
        print("can fly")
    }
}
