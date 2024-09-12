//
//  EventListView.swift
//  Event Countdown
//
//  Created by Khanh on 9/9/24.
//

import SwiftUI

struct EventListView: View {
    @State var eventList = Event.all()
    
    var body: some View {
        List(eventList.sorted(by: { $0.date < $1.date})) { event in
            NavigationLink {
                EventDetailView(event: event, eventList: $eventList)
            } label: {
                EventItem(event: event)
                    .swipeActions {
                        Button {
                            deleteEvent(event)
                        } label: {
                            Image(systemName: "trash")
                                .tint(.red)
                        }
                    }
            }
        }
        .navigationTitle("Events")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    EventDetailView(eventList: $eventList)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    private func deleteEvent(_ event: Event) {
        withAnimation {
            if let index = eventList.firstIndex(of: event) {
                eventList.remove(at: index)
            }
        }
    }
}

#Preview {
    EventListView()
}
