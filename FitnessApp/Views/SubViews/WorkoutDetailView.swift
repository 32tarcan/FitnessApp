//
//  WorkoutDetailView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct WorkoutDetailView: View {
    @ObservedObject var viewModel: WorkoutViewModel
    let workout: WorkoutData
    
    var body: some View {
        VStack {
            WebView(urlString: workout.videoURL)
                .frame(width: 360, height: 200)
                .cornerRadius(8)
                .shadow(color: Color(hex: "1E8FB2").opacity(0.5), radius: 10, x: 0, y: 5)
                .padding()

            HStack {
                Button(action: {
                    viewModel.selectedButton = "Explanation"
                })  {
                    VStack {
                        Text("Explanation")
                            .foregroundColor(viewModel.selectedButton == "Explanation" ? Color(hex: "1E8FB2") : .white)
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(viewModel.selectedButton == "Explanation" ? Color(hex: "1E8FB2") : .clear)
                    }
                }
                Button(action: {
                    viewModel.selectedButton = "Focus"
                })  {
                    VStack {
                        Text("Focus")
                            .offset(x: -10)
                            .foregroundColor(viewModel.selectedButton == "Focus" ? Color(hex: "1E8FB2") : .white)
                        Rectangle()
                            .frame(height: 2)
                            .offset(x: -10)
                            .foregroundColor(viewModel.selectedButton == "Focus" ? Color(hex: "1E8FB2") : .clear)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            ScrollView(showsIndicators: false) {
                if viewModel.selectedButton == "Explanation" {
                    ExplanationView(workout: workout)
                        .padding(.horizontal)
                        .padding(.top, 20)
                } else if viewModel.selectedButton == "Focus" {
                    FocusView(workout: workout)
                }
            }
        }
        .navigationBarTitle(Text(workout.title), displayMode: .inline)
        .padding()
        .onAppear {
            viewModel.selectedWorkout = workout
        }
    }
}

#Preview {
    let viewModel = WorkoutViewModel()
    let workout = WorkoutData(id: "1", title: "ABS Workout", duration: "1hour 20 minutes", level: "Beginner", progress: "1/3", imageName: "Training-3", videoURL: "https://www.youtube.com/watch?v=yKyrOmVoApM&feature=youtu.be", focus: "chest", explanation: "aslfnasflkaskaslf")
    viewModel.workouts = [workout]
    return WorkoutDetailView(viewModel: viewModel, workout: workout)
}

