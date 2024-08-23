//
//  ExercisesViewModel.swift
//  FitnessApp
//
//  Created by Sakans on 23.08.2024.
//

import SwiftUI
import FirebaseFirestore

class ExercisesViewModel: ObservableObject {
    
    @Published var exercises: [ExercisesData] = []
    @Published var selectedExercises: ExercisesData?
    
    func fetchExercise() {
        let db = Firestore.firestore()
        
        db.collection("single_exercises").getDocuments { (snapshot, error) in
            if let error = error {
                print("Bahadır: Error getting documents: \(error.localizedDescription)")
            } else if let snapshot = snapshot {
                if snapshot.isEmpty {
                    print("Bahadır: No documents found")
                } else {
                    var fetchedWorkouts: [ExercisesData] = []
                    
                    for document in snapshot.documents {
                        let data = document.data()
                        print(" Bahadır: Document data: \(data)")
                        
                        if let title = data["title"] as? String,
                           let gif = data["gif"] as? String {
                            let exercise = ExercisesData(
                                id: document.documentID,
                                title: title,
                                gif: gif
                            )
                            
                            fetchedWorkouts.append(exercise)
                        } else {
                            print("Bahadır: Some fields are missing in the document")
                        }
                    }
                    DispatchQueue.main.async {
                        self.exercises = fetchedWorkouts
                    }
                }
            } else {
                print("Bahadır: Snapshot is nil")
            }
        }
    }
}
