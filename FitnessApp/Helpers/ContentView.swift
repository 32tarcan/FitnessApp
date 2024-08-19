//
//  ContentView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var selectedTab = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    @State private var showOnboarding = false

    var body: some View {
        VStack {
            if authViewModel.isAuthenticated {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .tag(0)
                    
                    TimeView()
                        .tabItem {
                            Label("Time", systemImage: "timer")
                        }
                        .tag(1)
                    
                    ExerciseView()
                        .tabItem {
                            Label("Exercise", systemImage: "dumbbell")
                        }
                        .tag(2)
                    
                    ReportsView()
                        .tabItem {
                            Label("Reports", systemImage: "calendar")
                        }
                        .tag(3)
                    
                    SettingView()
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                        .tag(4)
                }
                .accentColor(Color(hex: "1E8FB2"))
                .preferredColorScheme(.dark)
                .onAppear {
                    if !hasSeenOnboarding {
                        showOnboarding = true
                        hasSeenOnboarding = true // Onboarding gösterildikten sonra işaretlenir
                    }
                    selectedTab = 0
                }
                .sheet(isPresented: $showOnboarding) {
                    OnboardingView(showOnboarding: $showOnboarding)
                        .environmentObject(authViewModel)
                }
            } else {
                Text("You are not authenticated")
                    .onAppear {
                        showOnboarding = true
                    }
                    .sheet(isPresented: $showOnboarding) {
                        OnboardingView(showOnboarding: $showOnboarding)
                            .environmentObject(authViewModel)
                    }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
