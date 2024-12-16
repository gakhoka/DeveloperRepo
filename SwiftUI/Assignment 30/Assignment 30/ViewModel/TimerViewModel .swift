//
//  TimerViewModel 2.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 11.12.24.
//

import SwiftUI

final class TimerViewModel: ObservableObject {
    @Published var timers: [TimerView] = []
    @Published var timeString: String = "00:00:00"
    @Published var isRunning = false
    @Published var timer: Timer?
    @Published var activities: [TimerActivity] = []
    @Published var defaultTimers = DefaultTimersModel.defaultTimers
    
    private var isPaused = false
    private var totalTimeInSeconds = 0
    private var remainingTime = 0
    
    var totalTimeWorked: TimeInterval {
        activities.reduce(0) { $0 + $1.timeWorked }
    }
    
    var sessionCount: Int {
        activities.reduce(0) { $0 + $1.sessionCount }
    }
    
    var timerActivitiesByDate: [Date: [TimerActivity]] {
            Dictionary(grouping: activities, by: { Calendar.current.startOfDay(for: $0.date) })
        }
    
    var averageTimeWorked: TimeInterval {
        guard  sessionCount > 0 else { return 0 }
        return totalTimeWorked / Double(sessionCount)
    }
 
    var timerActivities: [(title: String, value: String)] {
        let totalTimeString = totalTimeWorked.formatTimeInterval()
        let averageTimeString = activities.isEmpty ? "00:00:00" : averageTimeWorked.formatTimeInterval()

        return [
            (title: "დღევანდელი სესიები", value: "\(sessionCount) სესია"),
            (title: "საშუალო ხანგრძლივობა", value: averageTimeString),
            (title: "ჯამური დრო", value: totalTimeString)
        ]
    }
    
    func removeTimer(at index: Int) {
        guard timers.indices.contains(index) else { return }
        timers.remove(at: index)
    }

    func timerActivity() {
        let date = Calendar.current.startOfDay(for: Date())
        let currentHour = Calendar.current.component(.hour, from: Date())
        let currentMinute = Calendar.current.component(.minute, from: Date())
        
        let formattedTime = String(format: "%02d:%02d", currentHour, currentMinute)
        
        if let index = activities.firstIndex(where: { $0.date == date }) {
            activities[index].timeWorked += 1
            if isPaused {
                activities[index].sessionCount += 1
                isPaused = false
            }
        } else {
            activities.append(TimerActivity(sessionCount: 1, date: date, startHour: formattedTime, timeWorked: 1))
            isPaused = false
        }
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
            self?.timerActivity()
        }
    }

    func pauseTimer() {
        isRunning = false
        isPaused = true
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        isRunning = false
        timer?.invalidate()
        isPaused = false
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
