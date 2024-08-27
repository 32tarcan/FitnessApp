//
//  ReportsView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct ReportsView: View {
    @State private var selectedDates: Set<Date> = []
    @State private var currentMonth: Date = Date()
    @Environment(\.calendar) var calendar
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Don't Break The Chain!")
                .padding(.top, -40)
                .font(.largeTitle)
                .foregroundColor(Color(hex: "1E8FB2"))
            
            HStack {
                Button(action: {
                    changeMonth(by: -1)
                }) {
                    Image(systemName: "arrowshape.left")
                        .foregroundColor(Color(hex: "1E8FB2"))
                }
                Spacer()
                Text("\(formattedMonth(currentMonth))")
                Spacer()
                Button(action: {
                    changeMonth(by: 1)
                }) {
                    Image(systemName: "arrowshape.right")
                        .foregroundColor(Color(hex: "1E8FB2"))
                }
            }
            .padding()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(generateDaysForMonth(), id: \.self) { date in
                    Text("\(calendar.component(.day, from: date))")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(isDateSelected(date) ? Color(hex: "1E8FB2").opacity(0.7) : Color.clear)
                        .cornerRadius(40)
                }
            }
            .border(Color(hex: "1E8FB2"))
            .cornerRadius(5)
            .padding(.horizontal)
            
            Text("The Don't Break the Chain method is crucial because it helps build consistency and discipline by encouraging daily progress toward goals. Maintaining an unbroken chain of completed tasks can be highly motivating and reinforce positive habits.")
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundColor(.gray)
                .padding()
            Text("This technique is important as it visually represents one's commitment to personal or professional goals, making it easier to stay on track. By seeing continuous progress, individuals are less likely to procrastinate and more likely to achieve long-term success.")
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundColor(.gray)
                .padding()
            Text("Because it leverages the psychological principle of visual accountability, driving individuals to maintain their streak. The desire to keep the chain unbroken fosters a sense of accomplishment and encourages persistence in pursuing objectives.")
                .multilineTextAlignment(.center)
                .font(.caption)
                .foregroundColor(.gray)
                .padding()
        }
        .onAppear {
            if let lastLoginDate = authViewModel.lastLoginDate {
                addDateToSelected(lastLoginDate)
            }
            addTodayIfNeeded()
        }
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

#Preview {
    ReportsView()
        .environmentObject(AuthViewModel())
}
