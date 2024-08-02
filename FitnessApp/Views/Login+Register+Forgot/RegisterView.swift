//
//  RegisterView.swift
//  FitnessApp
//
//  Created by Sakans on 2.08.2024.
//
import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var navigate = false
    
    var body: some View {
        ZStack {
            Image("Register")
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
                    Text("Name")
                        .foregroundColor(Color.white)
                    
                    TextField("Name", text: $name)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .shadow(radius: 10)
                    
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
                }
                .padding(.horizontal, 27.5)
                
                Button(action: {
                    self.navigate = true
                }) {
                    Text("SIGN UP")
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
                        .offset(y: -12)
                }
                .fullScreenCover(isPresented: $navigate) {
                    LoginView()
                }
                .padding(.bottom, 10)
            }
        }.navigationBarBackButtonHidden(true)
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
    RegisterView()
}
