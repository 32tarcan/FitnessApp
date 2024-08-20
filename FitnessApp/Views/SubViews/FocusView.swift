//
//  FocusView.swift
//  FitnessApp
//
//  Created by Sakans on 4.08.2024.
//

import SwiftUI

struct FocusView: View {
    let workout: WorkoutData
    
    var body: some View {
        VStack {
            Text("Focus Muscle")
                .bold()
                .font(.largeTitle)
            Image(workout.focus)
                .resizable()
                .frame(width: 200, height: 300)
                .cornerRadius(15)
        }
    }
}

#Preview {
    FocusView(workout: WorkoutData(id: "", title: "", duration: "", level: "", progress: "", imageName: "", videoURL: "", focus: "chest", explanation: ""))
}
