//
//  Modifiers.swift
//  Assignment 35
//
//  Created by Giorgi Gakhokidze on 27.12.24.
//

import Foundation
import SwiftUI

extension View {
    func customText() -> some View {
        modifier(TextModifier())
    }
}

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 200)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(5)
    }
}
