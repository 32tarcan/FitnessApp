//
//  ProfileView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var present = false
    
    var body: some View {
        List {
            Button(action: {
                self.present = true
            }) {
                HStack {
                    Image(systemName: "person")
                    Text("Profile")
                }
            }
            .sheet(isPresented: $present, content: {
                ReportsView()
            })
            .foregroundStyle(Color(hex: "1E8FB2"))
        }
    }
}

#Preview {
    SettingsView()
}
