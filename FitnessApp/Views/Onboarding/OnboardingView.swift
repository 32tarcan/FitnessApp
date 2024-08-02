//
//  OnboardingView.swift
//  FitnessApp
//
//  Created by Sakans on 3.08.2024.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    
    var body: some View {
        ZStack {
            Image("Onboarding")
                .resizable()
                .ignoresSafeArea()
                .opacity(0.5)
            VStack {
                Text("Start Your Daily\n Workout Now!")
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.largeTitle)
                    .offset(y: 100)
                Text("Thanks to this application, you will do your exercise in a planned manner and increase your efficiency to 100%.")
                    .multilineTextAlignment(.center)
                    .padding()
                    .offset(y: 150)
                
                Button(action: {
                    showOnboarding = false
                }) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.black, Color(hex: "1E8FB2")]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(10.0)
                        .padding(.top, 50)
                        .frame(width: 320)
                }
            }
        }
    }
}
