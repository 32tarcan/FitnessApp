//
//  ExerciseListView.swift
//  FitnessApp
//
//  Created by Sakans on 23.08.2024.
//

import SwiftUI
import Lottie

struct ExerciseListView: View {
    @ObservedObject var viewModel = ExercisesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.exercises.isEmpty {
                    LottieView(animationName: "Workout")
                        .frame(width: 200, height: 200)
                        .padding(.vertical, 200)
                    
                } else {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(viewModel.exercises, id: \.id) { exercise in
                            NavigationLink(destination: ExerciseDetailView(exercises: exercise)) {
                                ExerciseCardView(exercise: exercise)
                            }
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
