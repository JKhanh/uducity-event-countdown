//
//  Event.swift
//  Event Countdown
//
//  Created by Khanh on 9/9/24.
//

import Foundation
import SwiftUI

struct Event: Comparable, Identifiable, Hashable {
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date.timeIntervalSince1970 < rhs.date.timeIntervalSince1970
    }
    
    let id: UUID = UUID()
    var title: String
    var date: Date
    var textColor: SwiftUI.Color
}

extension Event {
    static func all() -> [Event] {
        let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            
            return [
                // Tết Nguyên Đán (Lunar New Year)
                Event(
                    title: "Tết Nguyên Đán",
                    date: formatter.date(from: "2025/02/10")!, // Adjust year for the upcoming Tết
                    textColor: .red
                ),
                
                // Giỗ Tổ Hùng Vương (Hung Kings’ Commemoration Day)
                Event(
                    title: "Giỗ Tổ Hùng Vương",
                    date: formatter.date(from: "2025/04/18")!, // Typically falls on the 10th day of the 3rd lunar month
                    textColor: .green
                ),
                
                // Ngày Giải Phóng Miền Nam (Reunification Day)
                Event(
                    title: "Ngày Giải Phóng Miền Nam",
                    date: formatter.date(from: "2027/04/30")!,
                    textColor: .blue
                ),
                
                // Ngày Quốc Khánh (Vietnam Independent Day)
                Event(
                    title: "Ngày Quốc Khánh",
                    date: formatter.date(from: "2024/09/02")!,
                    textColor: .yellow 
                )
            ]
    }
}
