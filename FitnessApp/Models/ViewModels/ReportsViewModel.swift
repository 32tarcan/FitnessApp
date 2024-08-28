//
//  ReportsViewModel.swift
//  FitnessApp
//
//  Created by Sakans on 28.08.2024.
//

import Foundation
import SwiftUI

class ReportsViewModel: ObservableObject {
    @Published var selectedDates: Set<Date> = []
    @Published var currentMonth: Date = Date()
    
    public let calendar: Calendar
    
    init(calendar: Calendar = .current) {
        self.calendar = calendar
    }

    func changeMonth(by value: Int) {
        if let newMonth = calendar.date(byAdding: .month, value: value, to: currentMonth) {
            currentMonth = newMonth
        }
    }

    func formattedMonth(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: date)
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

    func generateDaysForMonth() -> [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: currentMonth) else {
            return []
        }

        let days = calendar.dateComponents([.day], from: monthInterval.start, to: monthInterval.end).day!
        return (0..<days).compactMap {
            calendar.date(byAdding: .day, value: $0, to: monthInterval.start)
        }
    }
    
    func isDateSelected(_ date: Date) -> Bool {
        return selectedDates.contains { calendar.isDate($0, inSameDayAs: date) }
    }

    func addDateToSelected(_ date: Date) {
        selectedDates.insert(date)
    }
    
    func addTodayIfNeeded() {
        let today = Date()
        if !selectedDates.contains { calendar.isDate($0, inSameDayAs: today) } {
            selectedDates.insert(today)
        }
    }
}
