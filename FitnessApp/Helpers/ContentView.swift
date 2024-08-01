//
//  ContentView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = false
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            TimerView()
                .tabItem {
                    Image(systemName: "timer")
                }
                .tag(1)
            
            ExerciseView()
                .tabItem {
                    Image(systemName: "dumbbell")
                }
                .tag(2)
            
            ReportsView()
                .tabItem {
                    Image(systemName: "calendar")
                }
                .tag(3)
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(3)
        }
        .padding(.vertical, -55)
        .accentColor(Color(hex: "1E8FB2"))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
