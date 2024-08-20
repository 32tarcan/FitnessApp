//
//  WorkoutListView.swift
//  FitnessApp
//
//  Created by Sakans on 20.08.2024.
//

import SwiftUI

struct WorkoutListView: View {
    @StateObject var vm = WorkoutViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(vm.workouts) { workout in
                    WorkoutCardView(workout: workout)
                        .padding(.horizontal)
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

#Preview {
    WorkoutListView()
}
