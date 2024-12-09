//
//  UserInfoView.swift
//  Assignment 29
//
//  Created by Giorgi Gakhokidze on 08.12.24.
//

import SwiftUI

struct UserInfoView: View {
    
    private let skills = ["iOS Developer", "Swift Enthusiast", "Tech Lover"]
    @State private var text = ""
    
    var body: some View {
        VStack {
            catImage
            name
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    ForEach(skills, id: \.self) { skill in
                        Text(skill)
                            .foregroundStyle(Color.lightGray)
                            .fontAppearance()
                        if skill != skills.last {
                            Text("|")
                                .fontAppearance()
                        }
                    }
                }
                workExperience
            }
            .padding()
            
            ZStack {
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        workPlace
                        Text("IOS developer")
                        Text("2021-present")
                    }
                    .fontWeight(.ultraLight)
                    .leadingPadding()
                    Spacer()
                }
                .padding()
            }
            .roundedRectangleStyle(height: 141)
            
            ZStack {
                VStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        addNewWorkingExperience
                        Text("COMPANY")
                        TextField("Enter company name", text: $text)
                            .textFieldStyle()
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("ROLE")
                        TextField("Enter role", text: $text)
                            .textFieldStyle()
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("ENTER DURATION")
                        TextField("Enter duration", text: $text)
                            .textFieldStyle()
                    }
                    .padding(.horizontal)
                    
                    addButton
                }
                .font(.system(size: 9, weight: .ultraLight))
                .padding()
            }
            .roundedRectangleStyle()
            .padding()
        }
    }
    
    private var addButton: some View {
        Button("Add Experience") {}
            .buttonStyle(width: 312, height: 40, cornerRadious: 10)
            .padding(.top, 16)
            .fontAppearance()
    }
    
    private var workPlace: some View {
        Text("HDR Solutions inc.")
            .padding(.horizontal, 8)
            .font(.system(size: 18))
            .fontWeight(.medium)
    }
    
    private var workExperience: some View {
        Text("Work Experience")
            .fontAppearance(size: 20)
    }
    
    private var addNewWorkingExperience: some View {
        Text("Add New Working Experience")
            .fontAppearance(size: 22)
            .padding(.horizontal, -10)
            .padding(.vertical, 5)
    }
    
    private var catImage: some View {
        Image("cat")
            .resizable()
            .imageModifier(lineWidth: 10)
            .shadow(radius: 2, x: 0, y: 2)
            .padding(.vertical)
    }
    
    private var name: some View {
        Text("John Doe")
            .fontAppearance(size: 24)
    }
}

#Preview {
    UserInfoView()
}
