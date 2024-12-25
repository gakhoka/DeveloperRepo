//
//  Circle.swift
//  Assignment 33
//
//  Created by Giorgi Gakhokidze on 18.12.24.
//

import SwiftUI

struct CircleSegment: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var radius: CGFloat
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        path.move(to: center)
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        path.closeSubpath()
        
        return path
    }
}

struct DividerLine: Shape {
    var startAngle: Angle
    var radius: CGFloat
    
    var animatableData: Double {
        get { startAngle.radians }
        set { startAngle = Angle(radians: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let start = CGPoint(x: center.x + radius * (cos(startAngle.radians)),
                            y: center.y + radius * sin(startAngle.radians))
        
        path.move(to: center)
        path.addLine(to: start)
        
        return path
    }
}


