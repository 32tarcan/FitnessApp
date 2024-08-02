//
//  ContentView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showOnboarding = false

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            TimeView()
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
            
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                }
                .tag(4)
        }
        .padding(.vertical, -50)
        .accentColor(Color(hex: "1E8FB2"))
        .preferredColorScheme(.dark)
        .onAppear {
            showOnboarding = true
        }
        .sheet(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding)
        }
    }
}

#Preview {
    ContentView()
}
