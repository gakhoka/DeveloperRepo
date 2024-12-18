//
//  ContentView.swift
//  Assignment 33
//
//  Created by Giorgi Gakhokidze on 18.12.24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            SpinView()
                .tabItem {
                    Label("Spin", image: "wheel")
                }
                .tint(.customGreen)
            HoldView()
                .tabItem {
                    Label("Hold", image: "finger")
                }
            RotateView()
                .tabItem {
                    Label("Rotate", image: "rotate")
                }
            TrashView()
                .tabItem {
                    Label("Trash", image: "trash")
                }
        }
        .accentColor(.customGreen)
    }
}

#Preview {
    ContentView()
}
