//
//  ProfileView.swift
//  FitnessApp
//
//  Created by Sakans on 1.08.2024.
//

import SwiftUI

struct SettingView: View {
    
    @State private var present = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        VStack {
            List {
                Section {
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
                    Button(action: {
                        self.present = true
                    }) {
                        HStack {
                            Image(systemName: "heart")
                            Text("Favorites")
                        }
                    }
                    .sheet(isPresented: $present, content: {
                        ReportsView()
                    })
                    Button(action: {
                        self.present = true
                    }) {
                        HStack {
                            Image(systemName: "info.circle")
                            Text("Help")
                        }
                    }
                    .sheet(isPresented: $present, content: {
                        ReportsView()
                    })
                }
                Section {
                    Button(action: {
                        self.present = true
                    }) {
                        HStack {
                            Image(systemName: "lock")
                            Text("Privacy")
                        }
                    }
                    .sheet(isPresented: $present, content: {
                        ReportsView()
                    })
                    Button(action: {
                        self.present = true
                    }) {
                        HStack {
                            Image(systemName: "newspaper")
                            Text("Term Of Use!")
                        }
                    }
                    .sheet(isPresented: $present, content: {
                        ReportsView()
                    })
                    Button(action: {
                        self.present = true
                    }) {
                        HStack {
                            Image(systemName: "star")
                            Text("Rate Us!")
                        }
                    }
                    .sheet(isPresented: $present, content: {
                        ReportsView()
                    })
                    Button(action: {
                        self.present = true
                    }) {
                        HStack {
                            Image(systemName: "cup.and.saucer")
                            Text("Buy me a coffee")
                        }
                    }
                    .sheet(isPresented: $present, content: {
                        ReportsView()
                    })
                }
                
            }
            .foregroundStyle(Color(hex: "1E8FB2"))
            
            Button(action: {
                //action
            }) {
                Text("Logout")
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50)
                    .background(.red)
                    .cornerRadius(16)
                    .padding()
                    
            }
            .padding(.bottom, 250)
        }
    }
}

#Preview {
    SettingView()
}
