//
//  ContentView.swift
//  Event Countdown
//
//  Created by Khanh on 4/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            EventListView()
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                /* At the first time coming back from EventDetailView, the title are being set as .inline title. A second navigate view fixed it
                 I tried to add this line to fix the issue but doesn't work :((((
                 */
                UINavigationBar.appearance().prefersLargeTitles = true
            }
        }
    }
}

#Preview {
    ContentView()
}
