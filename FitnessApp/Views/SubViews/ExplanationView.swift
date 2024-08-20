//
//  ExplanationView.swift
//  FitnessApp
//
//  Created by Sakans on 4.08.2024.
//

import SwiftUI

struct ExplanationView: View {
    var workout: WorkoutData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            let explanations = workout.explanation.components(separatedBy: ",")
            ForEach(0..<explanations.count, id: \.self) { index in
                Text(explanations[index].trimmingCharacters(in: .whitespacesAndNewlines))
                    .padding()
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .background(Color(hex: "1E8FB2"))
                    .cornerRadius(8)
                    .shadow(color: Color(hex: "1E8FB2").opacity(0.7), radius: 10, x: 0, y: 5)
            }
        }
        .padding()
    }
}

#Preview {
    ExplanationView(workout: WorkoutData(id: "", title: "", duration: "", level: "", progress: "", imageName: "", videoURL: "", focus: "", explanation: "DB Bench Press - Ignition Set then 20 Effective Reps as a Rest/Pause,Cable Crossovers - Ignition Set then 20 Effective Reps as a Rest/Pause,DB Thumbs Up Incline Bench Press - Ignition Set then 20 Effective Reps as a Rest/Pause,Weighted Dips - Ignition Set then 10 Effective Reps as a Rest/Pause as a Pause Dip, Omni Crossovers - Ignition Set then 15 Effective Reps as a Rest/Pause with each arm in high position, Optional: Static Hold Pushups x 20 reps using a 5 second isometric hold at the bottom of each rep (Rest/Pause)"))
}




