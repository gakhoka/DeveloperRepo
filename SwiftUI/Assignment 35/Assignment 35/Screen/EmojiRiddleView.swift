//
//  EmojiRiddleView.swift
//  Assignment 35
//
//  Created by Giorgi Gakhokidze on 27.12.24.
//



import SwiftUI

struct EmojiRiddleView: View {
    
    @ObservedObject var viewModel: RiddleViewModel
    @Environment(\.dismiss) var dismiss
    var category: String
    @State private var selectedAnswer = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                VStack {
                    HStack {
                        ForEach(0..<viewModel.lives, id: \.self) { _ in
                            lives
                        }
                        Spacer()
                        level
                        Spacer()
                        score
                    }
                    .padding(.leading)
                }
                
                emojis
                
                Text(viewModel.hintMessage)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    if let currentRiddle = viewModel.getCurrentRiddle() {
                        ForEach(currentRiddle.answers, id: \.self) { answer in
                            Button(action: {
                                viewModel.checkAnswer(selectedAnswer: answer)
                                selectedAnswer = answer
                            }) {
                                Text(answer)
                                    .customText()
                            }
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    restartButton
                    hintButton
                }
                message
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    dismissButton
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Riddle Completed"),
                    message: Text(viewModel.alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            .navigationTitle(category)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var lives: some View {
        Image(systemName: "heart.fill")
            .foregroundColor(.red)
            .scaleEffect(viewModel.isLifeDeducting ? 1.7 : 1)
            .animation(viewModel.isLifeDeducting ? .easeIn(duration: 1) : nil, value: viewModel.isLifeDeducting)
    }
    
    private var restartButton: some View {
        Button {
            viewModel.restartGame()
        } label: {
            Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90")
                .foregroundColor(.black)
        }
    }
    
    private var emojis: some View {
        Text(viewModel.getCurrentRiddle()?.emojis ?? "")
            .font(.system(size: 50))
            .padding()
    }
    
    private var score: some View {
        HStack {
            Image("coin")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .scaleEffect(viewModel.isCorrect ? 1.2 : 1)
                .animation(.bouncy(duration: 1), value: viewModel.isCorrect)
            Text("\(viewModel.coins)")
                .padding(.trailing, 20)
                .scaleEffect(viewModel.isCorrect ? 1.2 : 1)
                .animation(.bouncy(duration: 1), value: viewModel.isCorrect)
        }
    }
    
    private var message: some View {
        Text(viewModel.message)
            .foregroundColor(viewModel.isCorrect ? .green : .red)
            .padding()
    }
    private var level: some View {
        Text("Level: \(viewModel.getCurrentRiddle()?.level ?? 1)")
          
    }
    
    private var hintButton: some View {
        Button {
            viewModel.showHint()
            
        } label: {
            Image(systemName: "lightbulb.fill")
                .foregroundColor(.yellow)
                .imageScale(.large)
                .padding()
        }
    }
    
    private var dismissButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
        }
    }
}

#Preview {
    EmojiRiddleView(viewModel: RiddleViewModel(), category: "name")
}
