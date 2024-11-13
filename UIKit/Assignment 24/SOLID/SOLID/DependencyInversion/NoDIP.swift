//
//  NoDIP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

//MARK: WATCH კლასი დამოკიდებულია დაბალი საფეხურის მქონე კლასებზე ( ნეტფლიქსი , ტვ...) , როდესაც მოგვინდება ახალი კლასის დამატება მაგალითად amazonPrime ან hbo მოგვიწევს watch კლასის შეცვლა და ინსტანსების დამატება კლასში რაც მოუქნელობას იწვევს . ამის ნაცვლად უნდა შევქმნათ აბსტრაქცია (პროტოკოლი)  რომელზეც watch კლასი იქნება დამოკიდებული და რომელსაც ყველა დაბალი საფეხურის მქონდა კლასი დააკონფორმებს, watch კლასსი მარტივად გამოიყენებს შემდეგში ამას.

import Foundation
import UIKit

class Netflix {
    func watch(tvShow: String) {
        print("I am watching \(tvShow) on netflix")
    }
}

class Television {
    func watch(tvShow: String) {
        print("I am watching \(tvShow) on tv")
    }
}

class Youtube {
    func watch(tvShow: String) {
        print("I am watching \(tvShow) on yt")
    }
}

class PirateWebsites {
    func watch(tvShow: String) {
        print("I am watching \(tvShow) on pirate websites")
    }
}

class Watch {
    let netflix: Netflix
    let television: Television
    let youtube: Youtube
    let pirateWebsites: PirateWebsites
    
    init(netflix: Netflix, television: Television, youtube: Youtube, pirateWebsites: PirateWebsites) {
        self.netflix = netflix
        self.television = television
        self.youtube = youtube
        self.pirateWebsites = pirateWebsites
    }
}

func execute() {
    let netflix = Netflix()
    let television = Television()
    let youtube = Youtube()
    let pirateWebsites = PirateWebsites()
    
    let watchOn = Watch(netflix: netflix, television: television, youtube: youtube, pirateWebsites: pirateWebsites)
    
    watchOn.netflix.watch(tvShow: "Last of Us")
}


