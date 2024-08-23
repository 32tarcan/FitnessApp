//
//  ExerciseListView.swift
//  FitnessApp
//
//  Created by Sakans on 23.08.2024.
//

import SwiftUI

struct ExerciseListView: View {
    @ObservedObject var viewModel = ExercisesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.exercises.isEmpty {
                    Text("Loading exercises...")
                        .padding()
                } else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(viewModel.exercises, id: \.id) { exercise in
                            ExerciseView(exercise: exercise)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Exercises")
            .onAppear {
                viewModel.fetchExercise()
            }
        }
    }
}
