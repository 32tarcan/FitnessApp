//
//  LoginView.swift
//  FitnessApp
//
//  Created by Sakans on 2.08.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var navigate = false
    
    var body: some View {
        ZStack {
            Image("Login")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                
                Text("Hello\nUser!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 50)
                    .offset(x: -130)
                    .bold()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Mail")
                        .foregroundColor(Color.white)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .shadow(radius: 10)
                    
                    Text("Password")
                        .foregroundColor(Color.white)
                    
                    ZStack {
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5.0)
                                .shadow(radius: 10)
                        } else {
                            SecureField("Password", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(5.0)
                                .shadow(radius: 10)
                        }
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: self.isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 15)
                            }
                        }
                    }
                    .foregroundColor(.black)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            // Forgot password action
                        }) {
                            Text("Forgot password")
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal, 27.5)
                
                Button(action: {
                    self.navigate = true
                }) {
                    Text("SIGN IN")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(10.0)
                        .padding(.top, 50)
                        .frame(width: 320)
                }
                .fullScreenCover(isPresented: $navigate) {
                    ContentView()
                }
                HStack {
                    Text("Don't have account?")
                        .foregroundColor(.white).opacity(0.8)
                    Button(action: {
                       //action
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    LoginView()
}
