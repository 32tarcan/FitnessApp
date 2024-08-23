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
                Text(exercise.gif)
                    .foregroundStyle(.red)
                Text(exercise.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
            }
    }
}
#Preview {
    ExerciseView(exercise: ExercisesData(id: "asdsad", title: "asdsad", gif: "asdsad"))
}

