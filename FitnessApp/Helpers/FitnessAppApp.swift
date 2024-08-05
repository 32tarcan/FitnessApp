//
//  FitnessAppApp.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct YourApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if authViewModel.isAuthenticated {
                    ContentView()
                        .environmentObject(authViewModel)
                } else {
                    LoginView()
                        .environmentObject(authViewModel)
                }
            }
            .environmentObject(authViewModel) 
        }
    }
}
