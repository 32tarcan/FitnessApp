//
//  ExplanationView.swift
//  FitnessApp
//
//  Created by Sakans on 4.08.2024.
//

import SwiftUI

struct ExplanationView: View {
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
                
                Text(workout.duration)
                    .font(.subheadline)
                    .foregroundColor(.white)
                
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
    let workout = WorkoutData(id: "1", title: "ABS Workout", duration: "1hour 20 minutes", level: "Beginner", progress: "1/3", imageName: "Training-3", videoURL: "https://www.youtube.com/watch?v=yKyrOmVoApM&feature=youtu.be")
    return ExplanationView(workout: workout)
}
