//
//  DefaultTimers.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 15.12.24.
//

import SwiftUI

struct DefaultTimers: View {
    @ObservedObject var viewModel: TimerViewModel
    let defaultTimers: [(String, Int)] = [
        ("ჩაის დაყენება", 3 * 60),
        ("HIIT ვარჯიში", 7 * 60),
        ("კვერცხის მოხარშვა", 10 * 60),
        ("შესვენება", 15 * 60),
        ("ყავის პაუზა", 20 * 60),
        ("პომოდორო", 25 * 60),
        ("მედიტაცია", 30 * 60),
        ("ვარჯიში", 45 * 60),
        ("სამუშაო სესია", 60 * 60),
    ]
    
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
                    LazyVGrid(columns: gridItem) {
                        ForEach(defaultTimers, id: \.0) { timer in
                            Button {
                                viewModel.createTimer(name: timer.0, hours: 0, minutes: timer.1 / 60, seconds: timer.1 % 60)
                            }  label: {
                                VStack(alignment: .center) {
                                    Text(String(format: "%02d:%02d", timer.1 / 60, timer.1 % 60))
                                        .foregroundColor(.blue)
                                        .font(.system(size: 20, weight: .medium))

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
            .background(Color.black)
        }
    }
}

#Preview {
    DefaultTimers(viewModel: TimerViewModel())
}
