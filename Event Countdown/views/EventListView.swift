//
//  EventListView.swift
//  Event Countdown
//
//  Created by Khanh on 9/9/24.
//

import SwiftUI

enum DetailMode: Hashable {
    case add
    case edit(Event)
}

struct EventListView: View {
    @State var eventList = Event.all()
    
    var body: some View {
        List() {
            ForEach(eventList.sorted(by: { $0.date < $1.date})) { event in
                NavigationLink(value: DetailMode.edit(event)) {
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
        }
        .navigationTitle("Events")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: DetailMode.add) {
                    Image(systemName: "plus")
                }
            }
        }
        .navigationDestination(for: DetailMode.self) { mode in
            switch(mode) {
            case .add:
                EventDetailView() { event in
                    eventList.append(event)
                }
            case .edit(let editEvent):
                EventDetailView(event: editEvent) { event in
                    if let index = eventList.firstIndex(where: { $0.id == event.id }) {
                        eventList[index] = event
                    }
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
