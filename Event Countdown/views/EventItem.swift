//
//  EventItem.swift
//  Event Countdown
//
//  Created by Khanh on 9/9/24.
//

import SwiftUI

struct EventItem: View {
    let event: Event
    
    var body: some View {
        VStack {
            Text(event.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(event.textColor)
            Text(event.date.daysFromToday())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .font(.title3)
        }
    }
}

#Preview {
    EventItem(event: Event(title: "New Event Yo!", date: Date(), textColor: .blue))
}
