//
//  ContentView.swift
//  Assignment 34
//
//  Created by Giorgi Gakhokidze on 24.12.24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @StateObject var viewModel = MusicViewModel()
    @State private var isPresented = false
    @State var selectedSong: Song?
    
    var body: some View {
        NavigationView {
            ZStack {
                backGround
                List {
                    ForEach(viewModel.songs, id: \.self) { song in
                        HStack {
                            HStack {
                                Image(song.author)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 50)
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(song.title)
                                    Text(song.author)
                                    if viewModel.isSongPlaying && viewModel.currentSong == song {
                                        Text( viewModel.timeRemaining)
                                    } else {
                                        Text("00:00")
                                    }
                                }
                            }
                            .onTapGesture {
                                selectedSong = song
                                isPresented = true
                            }
                            
                            Spacer()
                            
                            if viewModel.isSongPlaying &&  viewModel.currentSong == song {
                                Button {
                                    viewModel.pauseSound()
                                } label: {
                                    Label("", systemImage: "pause")
                                }
                            } else {
                                Button {
                                    viewModel.playSound(for: song)
                                } label: {
                                    Label("", systemImage: "play")
                                }
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .listRowBackground(Color.gray.opacity(0.4))
                }
                .scrollContentBackground(.hidden)
            }
            .sheet(isPresented: $isPresented) {
                if let selectedSong = selectedSong {
                    SongDetailView(song: selectedSong, viewModel: viewModel)
                }
            }
            .navigationTitle("Songs")
        }
    }
    
    private var backGround: some View {
        LinearGradient(colors: [.green, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
