//
//  ExerciseView.swift
//  FitnessApp
//
//  Created by Sakans on 2.08.2024.
//

import SwiftUI

struct ExerciseCardView: View {
    let exercise: ExercisesData
    
    var body: some View {
        VStack {
            if let url = URL(string: exercise.gif) {
                Image(exercise.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(8)
                    .clipped()
                    .shadow(color: Color(hex: "1E8FB2").opacity(0.5), radius: 10, x: 0, y: 5)

            } else {
                LottieView(animationName: "Workout")
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 200)
            }
            Text(exercise.title)
                .font(.headline)
                .foregroundColor(.white)
                
        }
    }
}

#Preview {
    ExerciseCardView(exercise: ExercisesData(id: "example_id", title: "Example Title", gif: "https://example.com/gif.gif", image: "Exercise-2"))
}
