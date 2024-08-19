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
    @State private var registerNav = false
    @State private var forgotNav = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("Login")
                    .resizable()
                    .ignoresSafeArea()
                Image("Rectangle")
                    .resizable()
                    .background(Color.black)
                    .cornerRadius(20)
                    .opacity(0.5)
                    .frame(width: 370, height: 450)
                    .offset(y: 60)
                
                VStack {
                    Text("Hello\nUser!")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 50)
                        .offset(x: -130)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Email")
                            .foregroundColor(Color.white)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .shadow(radius: 10)
                            .autocapitalization(.none)
                        
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
                                self.forgotNav = true
                            }) {
                                Text("Forgot password")
                                    .foregroundColor(.white)
                            }
                            NavigationLink(
                                destination: ForgotPasswordView(),
                                isActive: $forgotNav
                            ) {
                                EmptyView()
                            }
                        }
                    }
                    .padding(.horizontal, 27.5)
                    
                    Button(action: {
                        authViewModel.signIn(email: email, password: password)
                    }) {
                        Text("SIGN IN")
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
                            .offset(y: -20)
                    }
                    .onChange(of: authViewModel.isAuthenticated) { isAuthenticated in
                        if isAuthenticated {
                            hasSeenOnboarding = false // Kullanıcı giriş yaptığında onboarding'i sıfırla
                            navigate = true
                        }
                    }
                    .fullScreenCover(isPresented: $navigate) {
                        ContentView()
                            .environmentObject(authViewModel)
                    }
                    HStack {
                        Text("Don't have account?")
                            .foregroundColor(.white).opacity(0.8)
                        NavigationLink(
                            destination: RegisterView(),
                            isActive: $registerNav
                        ) {
                            EmptyView()
                        }
                        Button(action: {
                            self.registerNav = true
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
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
