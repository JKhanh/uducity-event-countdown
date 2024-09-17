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
    let onSave: (Event) -> Void
    
    init(onSave: @escaping (Event) -> Void) {
        event = Event(title: "", date: Date(), textColor: .black)
        newEvent = event
        self.isCreate = true
        self.onSave = onSave
    }
    
    init(event: Event, onSave: @escaping (Event) -> Void) {
        self.event = event
        newEvent = event
        self.isCreate = false
        self.onSave = onSave
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
        onSave(newEvent)
        dismiss()
    }
}
