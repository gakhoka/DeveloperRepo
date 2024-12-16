//
//  ContentView.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 11.12.24.
//

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {

    @StateObject var viewModel = TimerViewModel()
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Color.customGray], startPoint: .top, endPoint: .bottom)
                VStack {
                    HStack {
                        Text("ტაიმერები")
                            .foregroundStyle(.white)
                            .fontAppearance(size: 24)
                        Spacer()
                        addButton
                    }
                    .frame(maxWidth: .infinity,maxHeight: 120, alignment: .leading)
                    .padding()
                    .background(Color.customGray)
                    
                    ScrollView {
                        ForEach(viewModel.timers.indices, id: \.self) { index in
                            NavigationLink(destination: TimerDetailView(name: viewModel.timers[index].name, viewModel: viewModel.timers[index].viewModel, totalTimeWorked: TimeInterval())) {
                                
                                TimerView(viewModel: viewModel.timers[index].viewModel, name: viewModel.timers[index].name) {
                                    viewModel.removeTimer(at: index)
                                }
                            }
                        }
                    }
                    AddTimeVIew(viewModel: viewModel)
                        .frame(maxWidth: .infinity)
                }
            }
            .background(.black)
            .opacity(showingSheet ? 0.5 : 1)
            .ignoresSafeArea()
        }
        .sheet(isPresented: $showingSheet) {
            DefaultTimers(showingSheet: $showingSheet, viewModel: viewModel)
        }
    }
    
    private var addButton: some View {
        Button("", systemImage: "plus") {
            showingSheet = true
        }
        .frame(width: 32, height: 32)
        .foregroundColor(.white)
        .imageScale(.large)
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        ContentView()
    } else {
        // Fallback on earlier versions
    }
}
