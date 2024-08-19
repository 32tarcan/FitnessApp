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
        List(vm.workouts) { workout in
            WorkoutCardView(workout: workout)
        }
        .onAppear {
            vm.fetchWorkouts()
        }
    }
}
#Preview {
    WorkoutListView()
}
