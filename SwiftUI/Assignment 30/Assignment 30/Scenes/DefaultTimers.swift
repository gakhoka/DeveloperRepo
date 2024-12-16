//
//  DefaultTimers.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 15.12.24.
//

import SwiftUI

struct DefaultTimers: View {
    @Binding var showingSheet: Bool
    
    @ObservedObject var viewModel: TimerViewModel
    
    let gridItem = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ZStack {
                LinearGradient(colors: [Color.customGray], startPoint: .top, endPoint: .bottom)
                VStack {
                    HStack {
                        Text("სწრაფი ტაიმერები")
                            .foregroundStyle(.white)
                            .font(.system(size: 24))
                            .padding()
                        Spacer()
                    }
                    ScrollView {
                        LazyVGrid(columns: gridItem) {
                            ForEach(viewModel.defaultTimers, id: \.0) { timer in
                                Button {
                                    viewModel.createTimer(name: timer.0, hours: 0, minutes: timer.1 / 60, seconds: timer.1 % 60)
                                    showingSheet = false
                                }  label: {
                                    VStack(alignment: .center) {
                                        Text(formatTime(seconds: timer.1))
                                            .foregroundColor(.blue)
                                            .font(.system(size: 20))
                                        
                                        Spacer(minLength: 10)
                                        
                                        Text(timer.0)
                                            .foregroundColor(.white)
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.customGray)
                                    .cornerRadius(10)
                                }
                            }
                            .frame(minWidth: 130, minHeight: 100)
                            .padding(2)
                            .background(Color.customGray.ignoresSafeArea())
                        }
                        
                        .background(Color.black)
                        .presentationDetents([.height(390)])
                    }
                }
            }
            .background(Color.black)
        }
    }
    
    func formatTime(seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60

        return String(format: hours > 0 ? "%02d:%02d:%02d" : "%02d:%02d", hours, minutes, seconds)
    }
}

//#Preview {
//    DefaultTimers(showingSheet: $true, viewModel: TimerViewModel())
//}
