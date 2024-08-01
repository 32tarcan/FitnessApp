//
//  HomeView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedButton: String? = "All"
    
    let workouts = [
            ("ABS Workout", "1hour 20 minutes", "Beginner", "1/3", "Training-3"),
            ("Chest Workout", "2hour 20 minutes", "Beginner", "1/3", "Training-2"),
            ("Arms Workout", "2hour 30 minutes", "Beginner", "1/3", "Training-5"),
            ("Legs Workout", "2hour 10 minutes", "Beginner", "1/3", "Training-1"),
            ("Shoulder & Back", "1hour 10 minutes", "Beginner", "1/3", "Training-4")
        ]
        
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        selectedButton = "All"
                    })  {
                        VStack {
                            Text("All")
                                .foregroundColor(selectedButton == "All" ? Color(hex: "1E8FB2") : .white)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(selectedButton == "All" ? Color(hex: "1E8FB2") : .clear)
                        }
                    }
                    Button(action: {
                        selectedButton = "Beginner"
                    })  {
                        VStack {
                            Text("Beginner")
                                .offset(x: -10)
                                .foregroundColor(selectedButton == "Beginner" ? Color(hex: "1E8FB2") : .white)
                            Rectangle()
                                .frame(height: 2)
                                .offset(x: -10)
                                .foregroundColor(selectedButton == "Beginner" ? Color(hex: "1E8FB2") : .clear)
                        }
                    }
                    Button(action: {
                        selectedButton = "Intermediate"
                    })  {
                        VStack {
                            Text("Intermediate")
                                .foregroundColor(selectedButton == "Intermediate" ? Color(hex: "1E8FB2") : .white)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(selectedButton == "Intermediate" ? Color(hex: "1E8FB2") : .clear)
                        }
                    }
                    Button(action: {
                        selectedButton = "Advanced"
                    })  {
                        VStack {
                            Text("Advanced")
                                .foregroundColor(selectedButton == "Advanced" ? Color(hex: "1E8FB2") : .white)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(selectedButton == "Advanced" ? Color(hex: "1E8FB2") : .clear)
                        }
                    }
                }
                .font(.custom("", size: 16))
                .offset(x: -10)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("BEGINNER")
                            .font(.headline)
                            .padding(.leading)
                        
                        ForEach(workouts, id: \.0) { workout in
                            NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                                WorkoutCardView(title: workout.0, duration: workout.1, level: workout.2, progress: workout.3, imageName: workout.4)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Workouts", displayMode: .inline)
        }
    }
}

struct WorkoutCardView: View {
    let title: String
    let duration: String
    let level: String
    let progress: String
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 120)
                .clipped()
                .cornerRadius(10)
                .background(.black)
                .opacity(0.5)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(duration)
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                HStack {
                    Text(level)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(5)
                    
                    HStack {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.yellow)
                        Text(progress)
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
    HomeView()
}
