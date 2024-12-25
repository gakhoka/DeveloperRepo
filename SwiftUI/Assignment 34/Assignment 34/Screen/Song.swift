//
//  Song.swift
//  Assignment 34
//
//  Created by Giorgi Gakhokidze on 24.12.24.
//

import Foundation

struct Song: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
    let fileName: String
    let duration: String
    
    static let example = Song(title: "Woke Up This Morning", author: "Alabama3", fileName: "wokeupthismorning", duration: "3:33")
}
