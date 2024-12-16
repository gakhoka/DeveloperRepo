//
//  TimerDetailView.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 12.12.24.
//

import SwiftUI

@available(iOS 16.0, *)
struct TimerDetailView: View {
    
    let name: String
    @Environment(\.presentationMode) var presentation
    @ObservedObject var viewModel: TimerViewModel
    var totalTimeWorked: TimeInterval
    
    var body: some View {
        ZStack {
            gradient
            VStack {
                timerName
                VStack(spacing: 10) {
                    clockImage
                    Text("ხანგრძლივობა")
                    timerDuration
                }
                .roundedRectangleStyle(width: 357, height: 160)
                .padding(.top, 5)
                
                ActivityListView(viewModel: viewModel)
                    .roundedRectangleStyle(width: 357, height: 180)
                
                
                VStack(spacing: 10) {
                    HStack {
                        Text("აქტივობის ისტორია")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.leading, 35)
                            .padding(.top, 20)
                        Spacer()
                    }
 
                    ActivityHistoryView(viewModel: viewModel)
                    .scrollContentBackground(.hidden)
                    .frame(width: 400, height: 383)
                  
                }
                .background(Color.clear.edgesIgnoringSafeArea(.all))
            }
            .foregroundStyle(.white)
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                backButton
            }
        }
        .background(.black)
    }
    
    private var backButton: some View {
        Button {
            presentation.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
        .foregroundColor(.white)
    }
    
    private var timerDuration: some View {
        Text(viewModel.totalTimeWorked.formatTimeInterval())
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .font(.system(size: 36, weight: .heavy))
    }
    
    private var clockImage: some View {
        Image("clock")
            .resizable()
            .scaledToFit()
            .frame(width: 70, height: 70)
    }
    
    private var timerName: some View {
        Text(name)
            .fontAppearance(size: 24)
            .frame(maxWidth: .infinity,maxHeight: 120)
            .background(Color.customGray)
            .padding(.top)
    }
    
    private var gradient: some View {
        LinearGradient(colors: [Color.customGray], startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        TimerDetailView(name: "name", viewModel: TimerViewModel(), totalTimeWorked: TimeInterval())
    }
}
