//
//  SpinView.swift
//  Assignment 33
//
//  Created by Giorgi Gakhokidze on 18.12.24.
//

import SwiftUI

struct SpinView: View {
 
    @StateObject private var viewModel = WheelviewModel()
    
    var body: some View {
        ZStack {
            Color.customGreen.edgesIgnoringSafeArea(.top)
            VStack {
                name
                Spacer()
                    ZStack {
                        ForEach(0..<viewModel.prizes.count, id: \.self) { index in
                            let startAngle = Angle(degrees: Double(index) * (360.0 / Double(viewModel.prizes.count)))
                            let endAngle = Angle(degrees: Double(index + 1) * (360.0 / Double(viewModel.prizes.count)))
                            CircleSegment(startAngle: startAngle, endAngle: endAngle, radius: 150)
                                .fill(viewModel.prizes[index].color)
                                .rotationEffect(viewModel.rotation)
                        }
                }
                .frame(width: 300, height: 300)
                .rotationEffect(viewModel.rotation)
                .gesture(
                    DragGesture()
                        .onEnded{ value in
                            if value.translation.height > 0 {
                                withAnimation(.easeIn(duration: 2)){
                                    viewModel.rotation =  Angle(degrees: 360 * Double.random(in: 1...5))
                                }
                            }
                        }
                )
                
                Spacer()
                prizeName
                spinButton
                    .padding()
            }
            .padding()
        }
    }
    
    private var spinButton: some View {
        Button(action: {
            viewModel.spinWheel()
        }) {
            Text("Spin the Wheel")
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(10)
        }
    }
    
    private var name: some View {
        Text("Wheel of Fortune")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .scaleEffect(viewModel.isSpinning ? 1.4 : 1)
            .animation(.easeIn, value: viewModel.isSpinning)
    }
    
    private var prizeName: some View {
        Text("You won \(viewModel.selectedPrize.name)")
            .font(.title)
            .foregroundColor(.white)
            .opacity(viewModel.showWinningText ? 1 : 0)
    }
}

#Preview {
    SpinView()
}

