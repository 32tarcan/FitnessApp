//
//  WorkoutCardViewModel.swift
//  FitnessApp
//
//  Created by Sakans on 4.08.2024.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var selectedButton: String = "Explanation"
    @Published var workouts: [WorkoutData] = []
    @Published var selectedWorkout: WorkoutData?
    
    init() {
        // Örnek verileri kullanın
        self.workouts = [
            WorkoutData(id: "1", title: "ABS Workout", duration: "1hour 20 minutes", level: "Beginner", progress: "1/3", imageName: "Training-3", videoURL: "https://www.youtube.com/watch?v=yKyrOmVoApM&feature=youtu.be"),
            WorkoutData(id: "2", title: "Chest Workout", duration: "2hour 20 minutes", level: "Beginner", progress: "1/3", imageName: "Training-2", videoURL: "https://www.youtube.com/watch?v=video2"),
            WorkoutData(id: "3", title: "Arms Workout", duration: "2hour 30 minutes", level: "Beginner", progress: "1/3", imageName: "Training-5", videoURL: "https://www.youtube.com/watch?v=video3"),
            WorkoutData(id: "4", title: "Legs Workout", duration: "2hour 10 minutes", level: "Beginner", progress: "1/3", imageName: "Training-1", videoURL: "https://www.youtube.com/watch?v=video4"),
            WorkoutData(id: "5", title: "Shoulder & Back", duration: "1hour 10 minutes", level: "Beginner", progress: "1/3", imageName: "Training-4", videoURL: "https://www.youtube.com/watch?v=video5")
        ]
    }
    
    // Firebase'den veri çekme işlevi yoruma alındı
    /*
    func fetchWorkouts() {
        let db = Firestore.firestore()
        
        db.collection("workouts").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    let data = document.data()
                    
                    if let title = data["title"] as? String,
                       let duration = data["duration"] as? String,
                       let level = data["level"] as? String,
                       let progress = data["progress"] as? String,
                       let imageName = data["imageName"] as? String,
                       let videoURL = data["videoURL"] as? String {
                        
                        let workout = WorkoutData(
                            id: document.documentID,
                            title: title,
                            duration: duration,
                            level: level,
                            progress: progress,
                            imageName: imageName,
                            videoURL: videoURL
                        )
                        
                        self.workouts.append(workout)
                    }
                }
            }
        }
    }
    */
}

