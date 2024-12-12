//
//  TimerViewModel 2.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 11.12.24.
//

import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var timers: [TimerView] = []
    @Published var timeString: String = "00:00:00"
    @Published var isRunning = false
    @Published var timer: Timer?
  
    private var totalTimeInSeconds: Int = 0
    private var remainingTime: Int = 0

    func removeTimer(at index: Int) {
        guard timers.indices.contains(index) else { return }
        timers.remove(at: index)
    }


    func createTimer(name: String, hours: Int, minutes: Int, seconds: Int) {
        let totalTime = (hours * 3600) + (minutes * 60) + seconds
        let newTimerViewModel = TimerViewModel()
        newTimerViewModel.totalTimeInSeconds = totalTime
        newTimerViewModel.remainingTime = totalTime
        newTimerViewModel.updateTimeString()

        let newTimer = TimerView(viewModel: newTimerViewModel, name: name, removeAction: nil)
        timers.append(newTimer)
    }
    
    func startTimer() {
        if isRunning { return }
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.updateRemainingTime()
        }
    }

    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
        remainingTime = totalTimeInSeconds
        updateTimeString()
    }

    private func updateRemainingTime() {
        if remainingTime > 0 {
            remainingTime -= 1
            updateTimeString()
        } else {
            pauseTimer()
            HapticFeedBack.shared.complexSuccess()
        }
    }
 
    private func updateTimeString() {
        let hours = remainingTime / 3600
        let minutes = (remainingTime % 3600) / 60
        let seconds = remainingTime % 60
        
        timeString = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
