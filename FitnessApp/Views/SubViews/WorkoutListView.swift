//
//  WorkoutListView.swift
//  FitnessApp
//
//  Created by Sakans on 20.08.2024.
//
import SwiftUI

struct WorkoutListView: View {
    @StateObject var vm = WorkoutViewModel()
    var selectedLevel: String? // Seçilen seviye

    var filteredWorkouts: [WorkoutData] {
        if let level = selectedLevel {
            return vm.workouts.filter { $0.level == level }
        } else {
            return vm.workouts
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(filteredWorkouts) { workout in
                        NavigationLink(destination: WorkoutDetailView(viewModel: vm, workout: workout)) {
                            WorkoutCardView(workout: workout)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .onAppear {
                if vm.workouts.isEmpty {
                    vm.fetchWorkouts()
                }
            }
        }
    }
}

#Preview {
    WorkoutListView(selectedLevel: "Beginner")
}
