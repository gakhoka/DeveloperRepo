//
//  DIP.swift
//  SOLID
//
//  Created by Giorgi Gakhokidze on 13.11.24.
//

protocol Watchable {
    func watch(_ tvShow: String)
}

class Netflix1: Watchable {
    func watch(_ tvShow: String) {
        print("I am watching \(tvShow) on netflix")
    }
}

class Youtube1: Watchable {
    func watch(_ tvShow: String) {
        print("I am watching \(tvShow) on yt")
    }
}

class Television1: Watchable {
    func watch(_ tvShow: String) {
        print("I am watching \(tvShow) on television")
    }
}

class WatchSomething {
    let platform: Watchable
    
    init(platform: Watchable) {
        self.platform = platform
    }
}

func watchTVshow() {
    let tv = Television1()
    let watchOnTv = WatchSomething(platform: tv)
    watchOnTv.platform.watch("Last of us")
}


