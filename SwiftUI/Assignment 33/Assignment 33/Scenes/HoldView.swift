//
//  HoldView.swift
//  Assignment 33
//
//  Created by Giorgi Gakhokidze on 18.12.24.
//

import SwiftUI

struct HoldView: View {
    
    let segmentCount = 10
    @State private var radius: CGFloat = 150
    @State private var isTapped = false
    
    var body: some View {
        ZStack {
            Color.customGreen.edgesIgnoringSafeArea(.top)
            
            ForEach(0..<segmentCount, id: \.self) { i in
                CircleSegment(startAngle: Angle(degrees: Double(i) * (360.0 / Double(segmentCount))),
                              endAngle: Angle(degrees: Double(i + 1) * (360.0 / Double(segmentCount))),
                              radius: radius)
                .fill(isTapped ? Color.customGreen : .white)
                .animation(.easeIn(duration: 3), value: isTapped)
                .onLongPressGesture(minimumDuration: 5) {
                    self.isTapped = true
                } onPressingChanged: { pressing in
                    if !pressing {
                        self.isTapped = false
                    }
                }
            }
            
            ForEach(0..<segmentCount, id: \.self) { i in
                DividerLine(startAngle: Angle(degrees: Double(i) * (360.0 / Double(segmentCount))),
                            radius: radius)
                .stroke(Color.black, lineWidth: 1)
            }
            
            Circle()
                .stroke(Color.black, lineWidth: 1)
                .frame(width: radius * 2, height: radius * 2)
        }
    }
}

#Preview {
    HoldView()
}
