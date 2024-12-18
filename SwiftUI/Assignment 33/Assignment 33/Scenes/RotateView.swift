//
//  RotateView.swift
//  Assignment 33
//
//  Created by Giorgi Gakhokidze on 18.12.24.
//

import SwiftUI

struct RotateView: View {
    
    @State var rotationAmount: Angle = .degrees(0)
    @State var finalPosition: Angle = .degrees(0)
    @State var zoomAmount = 0.0
    @State var finalZoomAmount = 1.0
    
    var body: some View {
        ZStack {
            Color.customGreen.edgesIgnoringSafeArea(.top)
            
            VStack {
                resetButton
                    .foregroundStyle(.white)
                Spacer()
                calculatorImage
                    .gesture (
                        RotationGesture()
                            .onChanged { value in
                                rotationAmount = value
                            }
                            .onEnded { value in
                                finalPosition += rotationAmount
                                rotationAmount = .degrees(0)
                            }
                    )
                    .simultaneousGesture(
                        MagnifyGesture()
                            .onChanged { value in
                                zoomAmount = value.magnification
                            }
                            .onEnded { value in
                                finalZoomAmount += zoomAmount
                                zoomAmount = 0.0
                            }
                    )
                Spacer()
            }
        }
    }
    
    private var calculatorImage: some View {
        Image("calculator")
            .resizable()
            .scaledToFit()
            .frame(width: 169, height: 198)
            .rotationEffect(rotationAmount + finalPosition)
            .scaleEffect(finalZoomAmount + zoomAmount)
    }
    
    private var resetButton: some View {
        Button("Reset") {
            rotationAmount = .degrees(0)
            finalPosition = .degrees(0)
            zoomAmount = 0.0
            finalZoomAmount = 1.0
        }
        .font(.system(size: 24))
    }
}

#Preview {
    RotateView()
}
