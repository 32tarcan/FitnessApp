//
//  WorkoutDetailView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI


struct WorkoutDetailView: View {
    let workout: (String, String, String, String, String)
    
    var body: some View {
        VStack {
            WebView(urlString: "https://www.youtube.com/watch?v=yKyrOmVoApM&feature=youtu.be")
                .frame(width: 360,height: 200)
                .cornerRadius(8)
                .shadow(color: Color(hex: "1E8FB2").opacity(0.5), radius: 10, x: 0, y: 5)
                .padding()
            Text(workout.0)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, -20)
            
            Text("Duration: \(workout.1)")
                .font(.headline)
                .padding(.top, 5)
            
            Text("Level: \(workout.2)")
                .font(.headline)
                .padding(.top, 5)
            
            Text("Progress: \(workout.3)")
                .font(.headline)
                .padding(.top, 5)
            
            Spacer()
        }
        .navigationBarTitle(Text(workout.0), displayMode: .inline)
        .padding()
    }
}
#Preview {
    WorkoutDetailView(workout: ("Morning Yoga", "30 mins", "Beginner", "50%", "Training-1"))
}
