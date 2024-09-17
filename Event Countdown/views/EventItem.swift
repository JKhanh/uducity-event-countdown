//
//  EventItem.swift
//  Event Countdown
//
//  Created by Khanh on 9/9/24.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    @State private var timeLeft = ""
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let formatter = RelativeDateTimeFormatter()
    
    var body: some View {
        VStack {
            Text(event.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(event.textColor)
            Text(timeLeft)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .font(.title3)
                .onAppear(perform: updateTimeLeft)
                .onReceive(timer, perform: { _ in
                    updateTimeLeft()
                })
        }
    }
    
    private func updateTimeLeft() {
        timeLeft = formatter.localizedString(for: event.date, relativeTo: Date.now)
    }
}

#Preview {
    EventItem(event: Event(title: "New Event Yo!", date: Date(), textColor: .blue))
}
