//
//  WorkoutCardData.swift
//  FitnessApp
//
//  Created by Sakans on 4.08.2024.
//

import Foundation

struct WorkoutData: Identifiable {
    var id: UUID
    var title: String
    var duration: String
    var level: String
    var progress: String
    var imageName: String
    var videoURL: String
}
