//
//  WorkoutCardViewModel.swift
//  FitnessApp
//
//  Created by Sakans on 4.08.2024.
//

import SwiftUI
import Firebase

class WorkoutViewModel: ObservableObject {
    @Published var selectedButton: String = "Explanation"
    @Published var workouts: [WorkoutData] = []
    @Published var selectedWorkout: WorkoutData?
    
    func fetchWorkouts() {
        let db = Firestore.firestore()
        
        db.collection("exercises").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
            } else if let snapshot = snapshot {
                if snapshot.isEmpty {
                    print("No documents found")
                } else {
                    var fetchedWorkouts: [WorkoutData] = []
                    
                    for document in snapshot.documents {
                        let data = document.data()
                        print("Document data: \(data)")
                        
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
                            
                            fetchedWorkouts.append(workout)
                        } else {
                            print("Some fields are missing in the document")
                        }
                    }
                    DispatchQueue.main.async {
                        self.workouts = fetchedWorkouts
                    }
                }
            } else {
                print("Snapshot is nil")
            }
        }
    }

}

