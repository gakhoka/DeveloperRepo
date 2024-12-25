//
//  TrashView.swift
//  Assignment 33
//
//  Created by Giorgi Gakhokidze on 18.12.24.
//

import SwiftUI

struct TrashView: View {
    @State private var dragAmount = CGSize.zero
    @State private var position = CGSize.zero
    @State private var isDragging = false
    @State private var isInTrash = false
    
    var body: some View {
        ZStack {
            Color.customGreen
                .edgesIgnoringSafeArea(.top)
            GeometryReader { geometry in
                VStack {
                    reviveButton
                    Spacer()
                    
                    if !isInTrash {
                        fileImage
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        isDragging = true
                                        dragAmount = value.translation
                                    }
                                    .onEnded { value in
                                        isDragging = false
                                        position.width += dragAmount.width
                                        position.height += dragAmount.height
                                        dragAmount = CGSize.zero
                                        
                                        let fileFrame = CGRect(
                                            x: position.width + dragAmount.width + geometry.size.width / 2 - 100,
                                            y: position.height + dragAmount.height + geometry.size.height / 2 - 100,
                                            width: 200,
                                            height: 200
                                        )
                                        
                                        
                                        let trashCanFrame = CGRect(
                                            x: geometry.size.width - 50,
                                            y: geometry.size.height - 70,
                                            width: 37,
                                            height: 49
                                        )
                                        
                                        if fileFrame.intersects(trashCanFrame) {
                                            isInTrash = true
                                        }
                                    }
                            )
                    }
                    
                    Spacer()
                    HStack {
                        Spacer()
                        trashcan
                    }
                }
            }
        }
    }
    
    private var fileImage: some View {
        Image("File")
            .resizable()
            .scaledToFit()
            .opacity(isDragging ? 0.6 : 1)
            .scaleEffect(isDragging ? 1.1 : 1)
            .animation(.spring(), value: isDragging)
            .frame(width: 200, height: 200)
            .offset(x: position.width + dragAmount.width, y: position.height + dragAmount.height)
    }
    
    private var reviveButton: some View {
        Button("Revive image") {
            isInTrash = false
            position = CGSize.zero
        }
        .foregroundColor(.white)
        .font(.system(size: 24))
    }
    
    private var trashcan: some View {
        Image("trashCan")
            .resizable()
            .scaledToFit()
            .frame(width: 37, height: 49)
            .scaleEffect(isDragging ? 1.5 : 1)
            .animation(.spring, value: isDragging)
            .padding()
    }
}

#Preview {
    TrashView()
}

