//
//  PlanetModel.swift
//  Assignment 17
//
//  Created by Giorgi Gakhokidze on 20.10.24.
//

import Foundation
import UIKit

class Planet {
    var name: String
    var area: Int
    var image: UIImage?
    var temperature: Int
    var mass: String
    var isFavorite: Bool

    init(name: String, area: Int, image: UIImage? = nil, temperature: Int, mass: String, isFavorite: Bool) {
        self.name = name
        self.area = area
        self.image = image
        self.temperature = temperature
        self.mass = mass
        self.isFavorite = isFavorite
    }
}
