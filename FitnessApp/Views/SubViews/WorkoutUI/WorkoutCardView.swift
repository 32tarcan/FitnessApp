//
//  WorkoutCardView.swift
//  FitnessApp
//
//  Created by Sakans on 4.08.2024.
//

import SwiftUI

struct WorkoutCardView: View {
    let workout: WorkoutData
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(workout.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 120)
                .clipped()
                .cornerRadius(10)
                .background(.black)
                .opacity(0.5)
            
            VStack(alignment: .leading) {
                Text(workout.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                HStack {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundColor(.white)
                    Text(workout.duration)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                HStack {
                    Text(workout.level)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(5)
                    
                    HStack {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.yellow)
                        Text(workout.progress)
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(5)
                }
            }
            .padding()
        }
    }
}

#Preview {
    let workout = WorkoutData(id: "1", title: "Chest Workout", duration: "1 hour", level: "Beginner", progress: "1/3", imageName: "Training-1", videoURL: "https://www.youtube.com/watch?v=video", focus: "chest", explanation: "")
    return WorkoutCardView(workout: workout)
}

