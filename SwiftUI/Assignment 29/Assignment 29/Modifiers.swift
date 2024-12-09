//
//  Modifiers.swift
//  Assignment 29
//
//  Created by Giorgi Gakhokidze on 09.12.24.
//

import SwiftUI

extension View {
    func textFieldStyle() -> some View {
        modifier(TextFieldStyle())
    }
    
    func fontAppearance(size: CGFloat = 15) -> some View {
        modifier(FontModifier(size: size))
    }
    
    func leadingPadding() -> some View {
        modifier(LeadingPadding())
    }
    
    func roundedRectangleStyle(width: CGFloat = 351, height: CGFloat = 298, cornerRadius: CGFloat = 24, color: Color = .customGray) -> some View {
        modifier(RoundedRectangleStyle(width: width, height: height, cornerRadius: cornerRadius, color: color))
    }
    
    func imageModifier(width: CGFloat = 102, height: CGFloat = 102, lineWidth: CGFloat) -> some View {
        modifier(ImageModifier(width: width, height: height, lineWidth: lineWidth))
    }
    
    func buttonStyle(width: CGFloat, height: CGFloat, cornerRadious: CGFloat) -> some View {
        modifier(ButtonModifier(width: width, height: height, cornerRadious: cornerRadious))
    }
}

struct TextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(height: 30)
    }
}

struct FontModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: .medium))
    }
}

struct LeadingPadding: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
    }
}

struct RoundedRectangleStyle: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(color)
                .frame(width: width, height: height)
            content
        }
    }
}

struct ImageModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    let lineWidth: CGFloat
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: width, height: height)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: lineWidth)
            )
    }
}

struct ButtonModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    let cornerRadious: CGFloat
    func body(content: Content) -> some View {
        content
            .frame(width: 312, height: 40)
            .background(Color.customGreen)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}
