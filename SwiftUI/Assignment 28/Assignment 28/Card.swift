//
//  Card.swift
//  Assignment 28
//
//  Created by Giorgi Gakhokidze on 05.12.24.
//

import Foundation
import SwiftUI

struct Card: View {
    
    @State private var isOn = false
    
    private var skills = ["SwiftUI", "iOS Development", "Problem solving", "UI/UX design"]
    private var systemImages = ["phone.fill", "envelope", "network"]
    
    
    var body: some View {
        ZStack {
            linearGradient
            VStack {
                VStack(spacing: Constants.spacing) {
                    ZStack(alignment: .bottomTrailing) {
                        catImage
                            .padding(10)
                        activityStatusLabel
                    }
                    name
                    jobDescription
                }
                
                HStack {
                    ForEach(systemImages, id: \.self) { image in
                        Image(systemName: image)
                            .padding()
                            .background(Color.imagesColor)
                            .clipShape(Circle())
                            .padding(5)
                            .shadow(radius: 5)
                    }
                }
                .padding()
                
                HStack {
                    VStack(alignment: .leading, spacing: Constants.spacing) {
                        skillsText
                        ForEach(skills, id: \.self) { skill in
                            Text("  • \(skill)")
                        }
                    }
                    Spacer()
                }
                .padding()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .allowsHitTesting(false)
                        .opacity(0.2)
                        .frame(width: 200, height: 50)
                    HStack {
                        toggleText
                        toggle
                    }
                }
            }
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .foregroundColor(Color.white)
    }
    
    
    
    private var activityStatusLabel: some View {
        Text(isOn ? "Online": "Offline")
            .frame(width: 70, height: 20)
            .background(isOn ? Color.customGreen : .red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .fontWeight(.heavy)
            .font(.system(size: 14))
    }
    
    private var catImage: some View {
        Image("cat")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .overlay(
                Circle()
                    .stroke(Color.white, lineWidth: 10)
            )
    }
    
    private var toggleText: some View {
        Text(isOn ? "Set offline": "Set online")
            .fontWeight(.light)
            .font(.system(size: Constants.fontSize))
    }
    
    private var toggle: some View {
        Toggle("", isOn: $isOn)
            .shadow(radius: 10)
            .frame(width: 60)
    }
    
    private var jobDescription: some View {
        Text("iOS Developer")
            .fontWeight(.light)
            .font(.system(size: Constants.fontSize))
    }
    
    private var linearGradient: some View {
        LinearGradient(colors: [Color.startColor, Color.endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    private var name: some View {
        Text("John Doe")
            .font(.system(size: 24))
            .fontWeight(.heavy)
    }
    
    private var skillsText: some View {
        Text("Skills")
            .font(.system(size: Constants.fontSize))
            .fontWeight(.heavy)
    }
    
    struct Constants {
        static let spacing = CGFloat(10)
        static let fontSize = CGFloat(20)
    }
}


#Preview {
    Card()
}

