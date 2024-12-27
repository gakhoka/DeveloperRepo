//
//  SongDetailView.swift
//  Assignment 34
//
//  Created by Giorgi Gakhokidze on 24.12.24.
//

import UIKit
import SwiftUI

struct SongDetailView: View {
    
    var song: Song
    @ObservedObject var viewModel: MusicViewModel
    @Environment(\.dismiss) var dismiss
    @State private var isFavorite = false
    
    var body: some View {
        ZStack {
            backGround
            VStack {
                HStack {
                    dismissButton
                        .padding()
                    Spacer()
                    Text("Now Playing")
                        .font(.title2)
                    Spacer()
                    favoritesButton
                }
                Spacer()
                VStack {
                    
                    Image(song.author)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(song.title)
                                .fontWeight(.heavy)
                                .font(.system(size: 22))
                            Text(song.author)
                            
                        }
                        .padding()
                        Spacer()
                    }
                    
                    ProgressView(progress: viewModel.progress)
                    HStack {
                        Text(viewModel.timePlayed)
                        Spacer()
                        Text(viewModel.timeRemaining)
                    }
                    .padding()
                    
                    HStack {
                        backwardsButton
                        playButton
                        forwardsButton
                    }
                    .padding(.top)
                }
                Spacer()
            }
            .foregroundStyle(.white)
        }
    }
    
    private var forwardsButton: some View {
        Button {
            
        } label: {
            Image("play")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
        }
    }
    
    private var backwardsButton: some View {
        Button {
            
        } label: {
            Image("rewind")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
        }
    }
    
    private var favoritesButton: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("", systemImage: isFavorite ? "heart.fill" : "heart")
                .tint(.yellow)
                .font(.system(size: 20))
        }
        .onTapGesture {
            isFavorite.toggle()
        }
    }
    private var dismissButton: some View {
        Button {
            dismiss()
        } label: {
            Label("", systemImage: "chevron.down")
                .tint(.red)
                .font(.system(size: 20))
        }
    }
    
    private var playButton: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 70, height: 70)
    
            if viewModel.isSongPlaying && viewModel.currentSong == song  {
                Button {
                    viewModel.pauseSound()
                } label: {
                    Image(systemName: "pause")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                }
            } else {
                Button {
                    viewModel.playSound(for: song)
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
    
    private var backGround: some View {
        LinearGradient(colors: [.green, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}


#Preview {
    SongDetailView(song: .example, viewModel: MusicViewModel())
}
