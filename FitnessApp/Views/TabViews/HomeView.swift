//
//  HomeView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = WorkoutViewModel()
    @State private var selectedButton: String? = "All"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        selectedButton = "All"
                    }) {
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
                    }) {
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
                    }) {
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
                    }) {
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
                        
                        ForEach(viewModel.workouts) { workout in
                            NavigationLink(destination: WorkoutDetailView(viewModel: viewModel, workout: workout)) {
                                WorkoutCardView(workout: workout)
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

#Preview {
    HomeView()
}
