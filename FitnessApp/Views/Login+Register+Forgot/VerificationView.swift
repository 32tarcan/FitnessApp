//
//  VerificationView.swift
//  FitnessApp
//
//  Created by Sakans on 2.08.2024.
//

import SwiftUI

struct VerificationView: View {
    @State private var code1: String = ""
    @State private var code2: String = ""
    @State private var code3: String = ""
    @State private var code4: String = ""
    @Environment(\.dismiss) var dismiss
    @FocusState private var focusedField: Field?
    
    enum Field {
        case code1, code2, code3, code4
    }
    
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
                
                VStack(spacing: 20) {
                    Text("Enter Verification Code")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.top, 40)
                    
                    HStack(spacing: 15) {
                        TextField("", text: $code1)
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .multilineTextAlignment(.center)
                            .background(Circle().stroke(Color.gray, lineWidth: 1))
                            .font(.title)
                            .focused($focusedField, equals: .code1)
                            .onChange(of: code1) { newValue in
                                if newValue.count > 1 {
                                    code1 = String(newValue.prefix(1))
                                }
                                if !newValue.isEmpty {
                                    focusedField = .code2
                                }
                            }
                        
                        TextField("", text: $code2)
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .multilineTextAlignment(.center)
                            .background(Circle().stroke(Color.gray, lineWidth: 1))
                            .font(.title)
                            .focused($focusedField, equals: .code2)
                            .onChange(of: code2) { newValue in
                                if newValue.count > 1 {
                                    code2 = String(newValue.prefix(1))
                                }
                                if !newValue.isEmpty {
                                    focusedField = .code3
                                }
                            }
                        
                        TextField("", text: $code3)
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .multilineTextAlignment(.center)
                            .background(Circle().stroke(Color.gray, lineWidth: 1))
                            .font(.title)
                            .focused($focusedField, equals: .code3)
                            .onChange(of: code3) { newValue in
                                if newValue.count > 1 {
                                    code3 = String(newValue.prefix(1))
                                }
                                if !newValue.isEmpty {
                                    focusedField = .code4
                                }
                            }
                        
                        TextField("", text: $code4)
                            .keyboardType(.numberPad)
                            .frame(width: 50, height: 50)
                            .multilineTextAlignment(.center)
                            .background(Circle().stroke(Color.gray, lineWidth: 1))
                            .font(.title)
                            .focused($focusedField, equals: .code4)
                            .onChange(of: code4) { newValue in
                                if newValue.count > 1 {
                                    code4 = String(newValue.prefix(1))
                                }
                                if !newValue.isEmpty {
                                    focusedField = nil
                                }
                            }
                    }
                    .foregroundColor(.white)
                    HStack {
                        Text("If you didn’t receive a code,")
                            .foregroundColor(.white)
                        
                        Button(action: {
                            // Resend code action
                        }) {
                            Text("Resend")
                                .foregroundColor(.red)
                        }
                    }
                    
                    Button(action: {
                        // Send code action
                    }) {
                        Text("Send")
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.black, Color(hex: "1E8FB2")]), startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    .padding(.top, 20)
                }
                .padding()
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
    VerificationView()
}
