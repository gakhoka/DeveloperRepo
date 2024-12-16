//
//  DateExtensions.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 13.12.24.
//

import Foundation

extension Date {
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}

extension TimeInterval {
     func formatTimeInterval() -> String {
         let hours = Int(self) / 3600
         let minutes = (Int(self) % 3600) / 60
         let seconds = Int(self) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

extension Int {
    func toTimeInterval() -> TimeInterval {
        return TimeInterval(self * 3600)
    }
}

extension String {
    func dateFormatter() -> String {
        let components = self.split(separator: ":").map { Int($0) ?? 0 }
        var result = ""
        
        if components.count == 3 {
            let hours = components[0]
            let minutes = components[1]
            let seconds = components[2]
            
            if hours > 0 {
                result += "\(hours)h "
            }
            if minutes > 0 {
                result += "\(minutes)m "
            }
            if seconds > 0 || result.isEmpty {
                result += "\(seconds)s"
            }
        }
        
        return result.trimmingCharacters(in: .whitespaces)
    }
}

