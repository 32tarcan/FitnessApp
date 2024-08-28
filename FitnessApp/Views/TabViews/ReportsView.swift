//
//  ReportsView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct ReportsView: View {
    @StateObject private var viewModel = ReportsViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            Text("Don't Break The Chain!")
                .padding(.top, -10)
                .font(.largeTitle)
                .foregroundColor(Color(hex: "1E8FB2"))
            
            HStack {
                Button(action: {
                    viewModel.changeMonth(by: -1)
                }) {
                    Image(systemName: "arrowshape.left")
                        .foregroundColor(Color(hex: "1E8FB2"))
                }
                Spacer()
                Text("\(viewModel.formattedMonth(viewModel.currentMonth))")
                Spacer()
                Button(action: {
                    viewModel.changeMonth(by: 1)
                }) {
                    Image(systemName: "arrowshape.right")
                        .foregroundColor(Color(hex: "1E8FB2"))
                }
            }
            .padding()

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(viewModel.generateDaysForMonth(), id: \.self) { date in
                    Text("\(viewModel.calendar.component(.day, from: date))")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .background(viewModel.isDateSelected(date) ? Color(hex: "1E8FB2").opacity(0.7) : Color.clear)
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
                viewModel.addDateToSelected(lastLoginDate)
            }
            viewModel.addTodayIfNeeded()
        }
    }
}

#Preview {
    ReportsView()
        .environmentObject(AuthViewModel())
}
