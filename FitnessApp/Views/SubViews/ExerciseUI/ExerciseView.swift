//
//  ExerciseView.swift
//  FitnessApp
//
//  Created by Sakans on 2.08.2024.
//

import SwiftUI

struct ExerciseView: View {
    let exercise: ExercisesData
    
    var body: some View {
        VStack {
            if let url = URL(string: exercise.gif) {
                GifImageView(url: url)
                    .frame(width: 150, height: 150)
                    .cornerRadius(14)
                    .shadow(color: Color(hex: "1E8FB2").opacity(0.5), radius: 15, x: 0, y: 5)
            } else {
                Text("Invalid URL")
                    .foregroundColor(.red)
            }
            Text(exercise.title)
                .font(.headline)
                .foregroundColor(.white)
                
        }
    }
}

#Preview {
    ExerciseView(exercise: ExercisesData(id: "example_id", title: "Example Title", gif: "https://example.com/gif.gif"))
}
