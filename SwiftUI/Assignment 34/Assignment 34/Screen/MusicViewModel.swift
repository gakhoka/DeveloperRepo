//
//  MusicViewModel.swift
//  Assignment 34
//
//  Created by Giorgi Gakhokidze on 24.12.24.
//

import AVFoundation
import Foundation


class MusicViewModel: ObservableObject {
    @Published var songs: [Song] = []
    @Published var isSongPlaying = false
    @Published var progress: Float = 0.0
    @Published var timeRemaining: String = "00:00"
    @Published var timePlayed: String = "00:00"

    private var audioPlayer: AVAudioPlayer?
    var currentSong: Song?
    var timer: Timer?

    init() {
        loadSongs()
    }

    private func loadSongs() {
        songs = [
            Song(title: "Woke Up This Morning", author: "Alabama3", fileName: "wokeupthismorning", duration: "3:33"),
            Song(title: "Reminder", author: "TheWeeknd", fileName: "Reminder", duration: "3:33"),
            Song(title: "Swimming Pools", author: "Kendrick Lamar", fileName: "SwimmingPools", duration: "3:33"),
            Song(title: "Viva La Vida", author: "Coldplay", fileName: "VivaLaVida", duration: "3;3"),
            Song(title: "Color Violet", author: "Tory Lanez", fileName: "The Color Violet", duration: "3:3"),
            Song(title: "Paddling Out", author: "Miike Snow", fileName: "Paddling Out", duration: "33"),
            Song(title: "God Knows", author: "Mando diao", fileName: "God Knows", duration: "3"),
            Song(title: "La La La", author: "Sam Smith", fileName: "La la la", duration: "33"),
            Song(title: "Let it happen", author: "Tame Impala", fileName: "TameImpala", duration: "3:35"),
        ]
    }

    
    func playSound(for song: Song) {
        if currentSong == song, let player = audioPlayer, !player.isPlaying {
            player.play()
            isSongPlaying = true
            startProgressTimer()
            return
        }

        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3") else {
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            currentSong = song
            isSongPlaying = true
            startProgressTimer()
        } catch {
            print(error.localizedDescription)
        }
    }

    func pauseSound() {
        isSongPlaying = false
        audioPlayer?.pause()
        stopProgressTimer()
    }

    private func startProgressTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in
            if let player = self?.audioPlayer {
                self?.progress = Float(player.currentTime / player.duration)
                
                let playedTime = player.currentTime
                let minutesPlayed = Int(playedTime) / 60
                let secondsPlayed = Int(playedTime) % 60
                self?.timePlayed = String(format: "%02d:%02d", minutesPlayed, secondsPlayed)
                
                
                let remainingTime = player.duration - player.currentTime
                let minutes = Int(remainingTime) / 60
                let seconds = Int(remainingTime) % 60
                self?.timeRemaining = String(format: "%02d:%02d", minutes, seconds)
            }
        }
    }

    private func stopProgressTimer() {
        timer?.invalidate()
        timer = nil
    }
}
