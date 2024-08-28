//
//  ExerciseDetailView.swift
//  FitnessApp
//
//  Created by Sakans on 28.08.2024.
//

import SwiftUI

struct ExerciseDetailView: View {
    
    let exercises: ExercisesData
    
    var body: some View {
        VStack {
            Text(exercises.title)
                .font(.system(size: 24))
                .bold()
            
            WebView(urlString: exercises.gif)
                .frame(width: 360, height: 500)
                .cornerRadius(8)
                .shadow(color: Color(hex: "1E8FB2").opacity(0.5), radius: 10, x: 0, y: 5)
                .padding()
                .padding(.bottom, 100)
        }
    }
}

#Preview {
    ExerciseDetailView(exercises: ExercisesData(id: "", title: "", gif: "", image: ""))
}
