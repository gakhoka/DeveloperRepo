//
//  ActivityListView.swift
//  Assignment 30
//
//  Created by Giorgi Gakhokidze on 16.12.24.
//

import SwiftUI

@available(iOS 16.0, *)

struct ActivityListView: View {
    
    @ObservedObject var viewModel: TimerViewModel
  
    var body: some View {
        List {
            ForEach(viewModel.timerActivities, id: \.title) { activity in
                HStack {
                    Text(activity.title)
                        .foregroundStyle(Color.grayText)
                    Spacer()
                    Text(activity.value)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .listRowSeparatorTint(.grayText)
                .listRowBackground(Color.clear)
            }
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    if #available(iOS 16.0, *) {
        ActivityListView(viewModel: TimerViewModel())
    } else {

    }
}
