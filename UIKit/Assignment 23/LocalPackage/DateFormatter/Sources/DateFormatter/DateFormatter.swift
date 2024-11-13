// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public extension String {
    func toFormattedDate() -> String? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        guard let date = formatter.date(from: self) else {
            return nil
        }

        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "EEEE, MMMM d, yyyy"
    
        return displayFormatter.string(from: date)
    }
}
