//
//  ExerciseView.swift
//  FitnessApp
//
//  Created by Sakans on 2.08.2024.
//

import SwiftUI

struct Exercise: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let duration: String
    let difficulty: String
}

struct ExerciseView: View {
    let exercises: [Exercise] = [
        Exercise(name: "Crunches", imageName: "crunches", duration: "1hour 20 minutes", difficulty: "1/3"),
        Exercise(name: "Decline Crunch", imageName: "decline_crunch", duration: "1hour 20 minutes", difficulty: "1/3"),
        Exercise(name: "Dumbel Side Bend", imageName: "dumbel_side_bend", duration: "1hour 20 minutes", difficulty: "1/3"),
        Exercise(name: "Hanging Leg Raise", imageName: "hanging_leg_raise", duration: "1hour 20 minutes", difficulty: "1/3"),
        Exercise(name: "Crunches", imageName: "crunches", duration: "1hour 20 minutes", difficulty: "1/3"),
        Exercise(name: "Crunches", imageName: "crunches", duration: "1hour 20 minutes", difficulty: "1/3")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar()
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                        ForEach(exercises) { exercise in
                            ExerciseCard(exercise: exercise)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Exercises")
        }
    }
}

struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Search Exercises", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .padding(.horizontal, 10)
        }
        .padding(.top, 10)
    }
}

struct ExerciseCard: View {
    let exercise: Exercise
    
    var body: some View {
        VStack {
            Image(exercise.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            Text(exercise.name)
                .font(.headline)
                .foregroundColor(.primary)
            Text(exercise.duration)
                .font(.subheadline)
                .foregroundColor(.secondary)
            HStack {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.yellow)
                Text(exercise.difficulty)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}

#Preview {
    ExerciseView()
}
