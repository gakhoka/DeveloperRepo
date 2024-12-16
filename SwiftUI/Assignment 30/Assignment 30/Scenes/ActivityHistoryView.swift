//
//  ActivityHistoryView.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 16.12.24.
//

import SwiftUI

@available(iOS 16.0, *)
struct ActivityHistoryView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.timerActivitiesByDate.keys.sorted(), id: \.self) { date in
                Section(header: Text(date.formatDate())
                    .foregroundColor(.grayText)
                    .font(.system(size: 14, weight: .medium))) {
                        ForEach(viewModel.timerActivitiesByDate[date]!, id: \.date) { activity in
                            HStack {
                                Text(activity.startHour)
                                    .font(.system(size: 14))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text(activity.timeWorked.formatTimeInterval())
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 8)
                            .listRowBackground(Color.clear)
                        }
                    }
                    .listRowSeparatorTint(Color.gray)
            }
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        ActivityHistoryView(viewModel: TimerViewModel())
    } else {
        // Fallback on earlier versions
    }
}
