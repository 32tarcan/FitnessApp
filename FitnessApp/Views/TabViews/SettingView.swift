//
//  ProfileView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI
import StoreKit

struct SettingView: View {
    @State private var present = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.requestReview) var requestReview
    
    
    var body: some View {
        VStack {
            List {
                Section {
                    Button(action: {
                        self.present = true
                    }) {
                        HStack {
                            Image(systemName: "newspaper")
                            Text("Terms of Use")
                        }
                    }
                    .sheet(isPresented: $present, content: {
                        PrivacyView()
                    })
                    Button(action: {
                        requestReview()
                    }) {
                        HStack {
                            Image(systemName: "star")
                            Text("Rate Us!")
                        }
                    }
                }
                Button(action: {
                    authViewModel.signOut()
                }) {
                    Text("Logout")
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color.red)
                        .cornerRadius(16)
                        .padding()
                }
            }
            .foregroundStyle(Color(hex: "1E8FB2"))
            
           
            
        }
    }
}

#Preview {
    SettingView()
        .environmentObject(AuthViewModel())
}
