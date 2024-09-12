//
//  EventDetailView.swift
//  Event Countdown
//
//  Created by Khanh on 9/9/24.
//

import SwiftUI

struct EventDetailView: View {
    @Environment(\.dismiss) var dismiss
    
    let event: Event
    @State var newEvent: Event
    @State var textUpdated = false
    var isCreate: Bool
    @Binding var eventList: [Event]
    
    init(eventList: Binding<[Event]>) {
        event = Event(title: "", date: Date(), textColor: .black)
        newEvent = event
        self.isCreate = true
        self._eventList = eventList
    }
    
    init(event: Event, eventList: Binding<[Event]>) {
        self.event = event
        newEvent = event
        self.isCreate = false
        self._eventList = eventList
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Event Title", text: $newEvent.title)
                    .foregroundStyle(newEvent.textColor)
                    .onChange(of: newEvent.title) {
                        if !textUpdated {
                            textUpdated.toggle()
                        }
                    }
                if newEvent.title.isEmpty && textUpdated {
                    Text("Title cannot be empty")
                        .font(.subheadline)
                        .foregroundStyle(.red)
                }
                DatePicker(selection: $newEvent.date) {
                    Text("Date")
                }
                ColorPicker("Color", selection: $newEvent.textColor)
            }
        }
        .navigationTitle(isCreate ? "Add Event" : "Edit \(event.title)")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    saveAndBackToMain()
                } label: {
                    Image(systemName: "checkmark")
                }
                .disabled(newEvent.title.isEmpty)
            }
        }
    }
    
    private func saveAndBackToMain() {
        if isCreate {
            eventList.append(newEvent)
        } else {
            if let index = eventList.firstIndex(where: { $0.id == newEvent.id }) {
                eventList[index] = newEvent
            }
        }
        dismiss()
    }
}
