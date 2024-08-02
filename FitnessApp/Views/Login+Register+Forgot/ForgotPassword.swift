//
//  ForgotPassword.swift
//  FitnessApp
//
//  Created by Sakans on 2.08.2024.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var navigate = false
    @State private var registerNav = false
    @Environment(\.dismiss) var dismiss
    @State private var verificationNav = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Forgot")
                    .resizable()
                    .ignoresSafeArea()
                Image("Rectangle")
                    .resizable()
                    .background(Color.black)
                    .cornerRadius(20)
                    .opacity(0.5)
                    .frame(width: 370, height: 300)
                    .offset(y: 10)
                
                VStack {
                    Text("Enter Email Adress")
                        .bold()
                        .font(.system(size: 24))
                        .padding()
                        Text("Email")
                            .foregroundColor(Color.white)
                            .bold()
                            .offset(x: -150)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .shadow(radius: 10)
                    .padding(.horizontal, 27)
                    
                    Button(action: {
                        self.verificationNav = true
                    }) {
                        Text("Send")
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
                    NavigationLink(
                        destination: VerificationView(),
                        isActive: $verificationNav
                    ) {
                        EmptyView()
                    }
                    
                    .padding(.bottom, 10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Label("Back", image: "Back")
                        .frame(width: 44, height: 44)
                        .background(Color(hex: "1E8FB2"))
                    
                }
            }
        }
    }
}

#Preview {
    ForgotPassword()
}
