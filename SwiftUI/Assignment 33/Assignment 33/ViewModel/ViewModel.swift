//
//  ViewModel.swift
//  Assignment 33
//
//  Created by Giorgi Gakhokidze on 18.12.24.
//

import Foundation
import SwiftUI

final class WheelviewModel: ObservableObject {

    @Published var prizes: [Prize] = []
    @Published var rotation: Angle = .degrees(0)
    @Published var selectedPrizeIndex = 0
    @Published var showWinningText = false
    @Published var isSpinning = false
    private var startAngle: Angle = .degrees(0)
    
    var selectedPrize: Prize {
        prizes[selectedPrizeIndex]
    }
   
    init() {
        createPrize(name: "Cash", color: .red)
        createPrize(name: "Trip", color: .green)
        createPrize(name: "Car", color: .blue)
        createPrize(name: "TV", color: .yellow)
        createPrize(name: "Laptop", color: .purple)
        createPrize(name: "Ps5", color: .cyan)
        createPrize(name: "House", color: .brown)
        createPrize(name: "Shoes", color: .indigo)
    }
    
    
    func createPrize(name: String, color: Color) {
        let newPrize = Prize(name: name, color: color)
        prizes.append(newPrize)
    }

 
    func spinWheel() {
        showWinningText = false
        isSpinning = true
        withAnimation(.linear(duration: 1.5)) {
            rotation += Angle(degrees: 360 * Double.random(in: 1...5))
        }
        
        let prizeIndex = Int(((rotation.degrees + 360) / 360).truncatingRemainder(dividingBy: Double(prizes.count)))
   
        selectedPrizeIndex = prizeIndex
        isSpinning = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.showWinningText = true
        }
        HapticFeedBack.shared.success()
    }
}


