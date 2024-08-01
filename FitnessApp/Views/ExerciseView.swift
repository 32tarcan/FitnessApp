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
    let difficulty: String
}

struct ExerciseView: View {
    let exercises: [Exercise] = [
        Exercise(name: "Crunches", imageName: "Exercises", difficulty: "1/3"),
        Exercise(name: "Decline Crunch", imageName: "Exercises-1", difficulty: "1/3"),
        Exercise(name: "Dumbel Side Bend", imageName: "Exercises-3", difficulty: "1/3"),
        Exercise(name: "Hanging Leg Raise", imageName: "Exercises-4", difficulty: "1/3"),
        Exercise(name: "Crunches", imageName: "Exercises-5", difficulty: "1/3"),
        Exercise(name: "Crunches", imageName: "Exercises-6", difficulty: "1/3")
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
                .padding(.top, 20)
            VStack(alignment: .leading, spacing: 10) {
                Text(exercise.name)
                    .font(.headline)
                    .foregroundColor(.white)
               
                HStack {
                    Image(systemName: "bolt.fill")
                        .foregroundColor(.yellow)
                    Text(exercise.difficulty)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(6)
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .cornerRadius(10)
        .shadow(color: Color(hex: "1E8FB2").opacity(0.5), radius: 10, x: 0, y: 5)
    }
}
#Preview {
    ExerciseView()
}
